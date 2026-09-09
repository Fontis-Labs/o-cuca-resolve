#!/usr/bin/env bash
# PostToolUse — quality gate on Write/Edit
# Runs formatter + lint + typecheck on the saved file and feeds errors back to
# Claude so it can self-correct before moving on.
# Also checks language.md rules:
#   • Identifiers in Portuguese → flag
#   • Hardcoded PT-BR strings outside i18n layer → flag

set -euo pipefail

INPUT=$(cat)
TOOL_NAME=$(printf '%s' "$INPUT" | python3 -c \
  "import json,sys; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null || true)

[[ "$TOOL_NAME" == "Write" || "$TOOL_NAME" == "Edit" ]] || exit 0

FILE_PATH=$(printf '%s' "$INPUT" | python3 -c \
  "import json,sys; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('file_path',''))" 2>/dev/null || true)

[ -z "$FILE_PATH" ] && exit 0
[ -f "$FILE_PATH" ] || exit 0

EXT="${FILE_PATH##*.}"
ISSUES=""

_add() { ISSUES="${ISSUES}${ISSUES:+$'\n'}$*"; }
_cmd() { command -v "$1" &>/dev/null; }

# ── Formatters / linters by language ─────────────────────────────────────────

case "$EXT" in
  ts|tsx)
    # Typecheck (project tsconfig)
    if _cmd tsc; then
      TSC_OUT=$(tsc --noEmit --skipLibCheck 2>&1 | grep "$FILE_PATH" || true)
      [ -n "$TSC_OUT" ] && _add "TypeScript errors:\n$TSC_OUT"
    fi
    # ESLint
    if _cmd eslint; then
      ESLINT_OUT=$(eslint --no-eslintrc -c eslint.config.* "$FILE_PATH" 2>&1 || true)
      [ -n "$ESLINT_OUT" ] && _add "ESLint:\n$ESLINT_OUT"
    fi
    # Prettier check
    if _cmd prettier; then
      PRETTIER_OUT=$(prettier --check "$FILE_PATH" 2>&1 || true)
      echo "$PRETTIER_OUT" | grep -q 'Forgot to run Prettier' \
        && _add "Prettier: arquivo não formatado. Run: prettier --write $FILE_PATH"
    fi
    ;;

  js|jsx|mjs|cjs)
    if _cmd eslint; then
      ESLINT_OUT=$(eslint "$FILE_PATH" 2>&1 || true)
      [ -n "$ESLINT_OUT" ] && _add "ESLint:\n$ESLINT_OUT"
    fi
    if _cmd prettier; then
      PRETTIER_OUT=$(prettier --check "$FILE_PATH" 2>&1 || true)
      echo "$PRETTIER_OUT" | grep -q 'Forgot to run Prettier' \
        && _add "Prettier: arquivo não formatado."
    fi
    ;;

  py)
    if _cmd ruff; then
      RUFF_OUT=$(ruff check "$FILE_PATH" 2>&1 || true)
      [ -n "$RUFF_OUT" ] && _add "Ruff:\n$RUFF_OUT"
      ruff format --check "$FILE_PATH" 2>&1 | grep -q 'reformatted' \
        && _add "ruff format: arquivo não formatado. Run: ruff format $FILE_PATH"
    fi
    if _cmd mypy; then
      MYPY_OUT=$(mypy "$FILE_PATH" --ignore-missing-imports 2>&1 || true)
      echo "$MYPY_OUT" | grep -qE 'error:' && _add "mypy:\n$MYPY_OUT"
    fi
    ;;

  dart)
    if _cmd dart; then
      DART_OUT=$(dart analyze "$FILE_PATH" 2>&1 || true)
      echo "$DART_OUT" | grep -qE 'error|warning' && _add "dart analyze:\n$DART_OUT"
    fi
    ;;

  swift)
    if _cmd swiftlint; then
      SWIFT_OUT=$(swiftlint lint --path "$FILE_PATH" 2>&1 || true)
      [ -n "$SWIFT_OUT" ] && _add "SwiftLint:\n$SWIFT_OUT"
    fi
    ;;

  go)
    if _cmd gofmt; then
      GOFMT_OUT=$(gofmt -l "$FILE_PATH" 2>&1 || true)
      [ -n "$GOFMT_OUT" ] && _add "gofmt: arquivo não formatado. Run: gofmt -w $FILE_PATH"
    fi
    if _cmd go; then
      GO_OUT=$(go vet "$FILE_PATH" 2>&1 || true)
      [ -n "$GO_OUT" ] && _add "go vet:\n$GO_OUT"
    fi
    ;;
esac

# ── language.md checks ───────────────────────────────────────────────────────
# Rule 1: identifiers in Portuguese → flag
# Checks camelCase and snake_case tokens against a PT-BR word list.
PT_WORDS='(variavel|funcao|classe|objeto|lista|arquivo|usuario|produto|pedido|valor|nome|resultado|erro|mensagem|dados|servico|repositorio|controlador|entidade|modelo|conexao|sessao|token|cliente|servidor|requisicao|resposta|config|parametro|tipo|status|campo|tabela|linha|coluna|banco|consulta|transacao|evento|fila|tarefa|tarefa|agendamento|relatorio|exportacao|importacao|autenticacao|autorizacao|permissao|perfil|senha|email|endereco|telefone|documento|contrato|pagamento|cobranca|fatura|saldo|conta|extrato|transferencia|saque|deposito|cartao|bandeira|parcela|juros|multa|desconto|cupom|categoria|subcategoria|marca|estoque|quantidade|preco|custo|margem|lucro|prejuizo|receita|despesa|orcamento|meta|indicador|dashboard|relatorio|grafico|filtro|busca|paginacao|ordenacao|selecao|inclusao|exclusao|alteracao|criacao|atualizacao|cancelamento|aprovacao|rejeicao|validacao|verificacao|confirmacao|notificacao|alerta|aviso|sucesso|falha|tentativa|reenvio|reprocessamento|integracao|webhook|callback|payload|requisicao|resposta|cabecalho|corpo|parametro|consulta|rota|endpoint|recurso|colecao|elemento|item|registro|entrada|saida|fluxo|processo|etapa|passo|estado|etapa)'

case "$EXT" in
  ts|tsx|js|jsx|mjs|py|dart|swift|go)
    PT_MATCHES=$(grep -onE "(^|[^a-zA-Z])${PT_WORDS}([^a-zA-Z]|$)" "$FILE_PATH" 2>/dev/null | head -5 || true)
    if [ -n "$PT_MATCHES" ]; then
      _add "language.md ⚑ Identificador em português detectado (código deve ser em inglês):\n$PT_MATCHES"
    fi
    ;;
esac

# Rule 2: hardcoded PT-BR strings outside i18n (only in TS/JS/TSX/JSX)
case "$EXT" in
  ts|tsx|js|jsx)
    # Look for quoted strings with accented chars or common PT-BR words NOT inside t()/i18n.*() calls
    PT_STRINGS=$(grep -onE '"[^"]*[áàãâéêíóôõúüçÁÀÃÂÉÊÍÓÔÕÚÜÇ][^"]*"|'"'"'[^'"'"']*[áàãâéêíóôõúüçÁÀÃÂÉÊÍÓÔÕÚÜÇ][^'"'"']*'"'" \
      "$FILE_PATH" 2>/dev/null | head -5 || true)
    if [ -n "$PT_STRINGS" ]; then
      # Filter out lines that already use t() / i18n
      UNGUARDED=$(echo "$PT_STRINGS" | while read -r line; do
        LINENO="${line%%:*}"
        LINETEXT=$(sed -n "${LINENO}p" "$FILE_PATH" 2>/dev/null || true)
        echo "$LINETEXT" | grep -qE '\bt\(|i18n\.|translate\(' || echo "$line"
      done)
      [ -n "$UNGUARDED" ] && _add "language.md ⚑ String PT-BR hardcoded fora de i18n:\n$UNGUARDED"
    fi
    ;;
esac

# ── Output ────────────────────────────────────────────────────────────────────
if [ -n "$ISSUES" ]; then
  # sound
  if [ "${CLAUDE_SOUND_ALERTS:-0}" = "1" ]; then
    f="${HOME}/.claude/sounds/spongebob-fail.mp3"
    if [ -f "$f" ]; then afplay "$f" 2>/dev/null &
    else afplay /System/Library/Sounds/Sosumi.aiff 2>/dev/null &
    fi
  fi
  printf '⚠️  quality-gate [%s]\n\n%b\n\nCorrija os problemas acima antes de continuar.' \
    "$FILE_PATH" "$ISSUES"
  exit 1   # non-zero feeds output back to Claude as context to self-correct
fi

exit 0
