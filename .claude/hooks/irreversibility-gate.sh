#!/usr/bin/env bash
# PreToolUse — Supabase MCP destructive operations gate
# Intercepts mutating Supabase MCP calls and asks user confirmation.
# Plays error sound if CLAUDE_SOUND_ALERTS=1.

set -euo pipefail

INPUT=$(cat)
TOOL_NAME=$(printf '%s' "$INPUT" | python3 -c \
  "import json,sys; d=json.load(sys.stdin); print(d.get('tool_name',''))" 2>/dev/null || true)

# Only Supabase MCP tools
case "$TOOL_NAME" in
  mcp__*[Ss]upabase*) ;;
  *) exit 0 ;;
esac

# Only destructive / mutating operations
case "$TOOL_NAME" in
  *execute_sql*|*apply_migration*|*delete*|*drop*|*reset*|*pause*|\
  *merge*|*create_project*|*create_branch*|*restore*) ;;
  *) exit 0 ;;
esac

# --- sound ---
_sound() {
  [ "${CLAUDE_SOUND_ALERTS:-0}" = "1" ] || return 0
  local f="${HOME}/.claude/sounds/sound-of-da-police.mp3"
  if [ -f "$f" ]; then afplay "$f" 2>/dev/null &
  else afplay /System/Library/Sounds/Basso.aiff 2>/dev/null &
  fi
}

_sound error

# --- confirmation via TTY ---
printf '\n\033[33m⚠️  IRREVERSIBILITY GATE\033[0m\n' >/dev/tty
printf 'Tool : %s\n'   "$TOOL_NAME"                   >/dev/tty
printf 'Input: %s\n'   "$(printf '%s' "$INPUT" | python3 -c \
  "import json,sys; d=json.load(sys.stdin); print(json.dumps(d.get('tool_input',{}), ensure_ascii=False))" 2>/dev/null || echo '?')" >/dev/tty
printf '\nOperação potencialmente irreversível no Supabase.\nConfirmar? [y/N] ' >/dev/tty
read -r CONFIRM </dev/tty

if [[ "${CONFIRM:-N}" != "y" && "${CONFIRM:-N}" != "Y" ]]; then
  printf '{"decision":"block","reason":"Irreversibility gate: usuário negou %s"}' "$TOOL_NAME"
  exit 0
fi

exit 0
