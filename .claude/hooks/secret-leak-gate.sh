#!/usr/bin/env bash
# PreToolUse — secret / credential leak prevention
# Blocks:
#   • Writes/Edits to .env files (always)
#   • Content containing AWS keys, service_role, PEM, credential patterns
#   • git commit when staged diff contains secrets (via gitleaks or grep fallback)
# Plays john-cena sound if CLAUDE_SOUND_ALERTS=1.

set -euo pipefail

INPUT=$(cat)
TOOL_NAME=$(printf '%s' "$INPUT" | python3 -c \
  "import json,sys; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null || true)
TOOL_INPUT=$(printf '%s' "$INPUT" | python3 -c \
  "import json,sys; d=json.load(sys.stdin); print(json.dumps(d.get('tool_input',{})))" 2>/dev/null || echo '{}')

# --- sound ---
_sound_leak() {
  [ "${CLAUDE_SOUND_ALERTS:-0}" = "1" ] || return 0
  local f="${HOME}/.claude/sounds/john-cena_5.mp3"
  if [ -f "$f" ]; then afplay "$f" 2>/dev/null &
  else afplay /System/Library/Sounds/Funk.aiff 2>/dev/null &
  fi
}

# --- secret patterns ---
_has_secret() {
  local text="$1"
  local found=""
  # AWS access key
  echo "$text" | grep -qE 'AKIA[0-9A-Z]{16}'         && found="AWS Access Key ID"
  # AWS secret key (heuristic: 40-char base64 next to secret/aws keywords)
  echo "$text" | grep -qiE '(aws_secret|secret_access_key)\s*[=:]\s*[A-Za-z0-9/+=]{40}' \
                                                       && found="${found:+$found, }AWS Secret Key"
  # Supabase service_role JWT or keyword
  echo "$text" | grep -qiE 'service_role'             && found="${found:+$found, }Supabase service_role"
  # PEM private key
  echo "$text" | grep -q 'BEGIN.*PRIVATE KEY'         && found="${found:+$found, }PEM private key"
  # Generic: PASSWORD/TOKEN/SECRET/API_KEY = high-entropy value (env format).
  # Value must be contiguous (no spaces => real secret, not prose) and not an
  # obvious placeholder, so API-doc/plan examples (API_KEY=<your-key>,
  # TOKEN=changeme, SECRET=your-value-here) don't false-positive.
  # ponytail: whole-text scan, so a real secret AND a placeholder in the same
  # file lets the real one slip; per-line scan if that ever bites.
  if echo "$text" | grep -qiE '(PASSWORD|TOKEN|SECRET|API_KEY|AUTH_KEY)[[:space:]]*=[[:space:]]*[A-Za-z0-9/+_.-]{16,}' \
     && ! echo "$text" | grep -qiE '(PASSWORD|TOKEN|SECRET|API_KEY|AUTH_KEY)[[:space:]]*=[[:space:]]*(your[_-]|xxx|example|placeholder|changeme|dummy|fake|sample|redacted|<|\{|\$)'; then
    found="${found:+$found, }credential in env format"
  fi

  if [ -n "$found" ]; then
    printf '%s' "$found"
    return 0
  fi
  return 1
}

# ── Write / Edit ─────────────────────────────────────────────────────────────
if [[ "$TOOL_NAME" == "Write" || "$TOOL_NAME" == "Edit" ]]; then
  FILE_PATH=$(printf '%s' "$TOOL_INPUT" | python3 -c \
    "import json,sys; d=json.load(sys.stdin); print(d.get('file_path',''))" 2>/dev/null || true)
  CONTENT=$(printf '%s' "$TOOL_INPUT" | python3 -c \
    "import json,sys; d=json.load(sys.stdin); print(d.get('content', d.get('new_string','')))" 2>/dev/null || true)

  # Block direct writes to .env files (history is forever)
  if [[ "$FILE_PATH" == *.env || "$FILE_PATH" == */.env || \
        "$FILE_PATH" == *.env.* && "$FILE_PATH" != *.env.example ]]; then
    _sound_leak
    printf '{"decision":"block","reason":"Secret-leak-gate: escrita direta em .env bloqueada. Use variáveis de ambiente ou um secrets manager."}'
    exit 0
  fi

  # Scan content for secrets
  if LEAK=$(_has_secret "$CONTENT"); then
    _sound_leak
    printf '{"decision":"block","reason":"Secret-leak-gate: padrão detectado no conteúdo — %s. Remova o segredo antes de escrever."}' "$LEAK"
    exit 0
  fi

  exit 0
fi

# ── Bash: git commit ──────────────────────────────────────────────────────────
if [[ "$TOOL_NAME" == "Bash" ]]; then
  CMD=$(printf '%s' "$TOOL_INPUT" | python3 -c \
    "import json,sys; d=json.load(sys.stdin); print(d.get('command',''))" 2>/dev/null || true)

  # Only intercept git commit commands
  if ! echo "$CMD" | grep -qE 'git\s+commit'; then
    exit 0
  fi

  # Try gitleaks first
  if command -v gitleaks &>/dev/null; then
    if ! gitleaks protect --staged --no-banner 2>/dev/null; then
      _sound_leak
      printf '{"decision":"block","reason":"Secret-leak-gate: gitleaks detectou segredo no staged diff. Limpe antes de commitar (historico git é permanente)."}'
      exit 0
    fi
  else
    # Fallback: grep staged diff
    STAGED=$(git diff --cached 2>/dev/null || true)
    if LEAK=$(_has_secret "$STAGED"); then
      _sound_leak
      printf '{"decision":"block","reason":"Secret-leak-gate: padrão detectado no staged diff — %s. Limpe antes de commitar (gitleaks não encontrado; instale para cobertura completa)."}' "$LEAK"
      exit 0
    fi
  fi

  exit 0
fi

exit 0
