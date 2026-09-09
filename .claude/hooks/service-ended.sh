#!/usr/bin/env bash
# Stop hook — plays a sound when Claude finishes a task.

[ "${CLAUDE_SOUND_ALERTS:-0}" = "1" ] || exit 0

CUSTOM="${HOME}/.claude/sounds/metalgearsolid.mp3"
if [ -f "$CUSTOM" ]; then
  afplay "$CUSTOM" 2>/dev/null &
else
  afplay /System/Library/Sounds/Glass.aiff 2>/dev/null &
fi

exit 0
