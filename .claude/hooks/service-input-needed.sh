#!/usr/bin/env bash
# Notification hook — plays a sound when Claude needs user input.

[ "${CLAUDE_SOUND_ALERTS:-0}" = "1" ] || exit 0

CUSTOM="${HOME}/.claude/sounds/crack_the_whip.mp3"
if [ -f "$CUSTOM" ]; then
  afplay "$CUSTOM" 2>/dev/null &
else
  afplay /System/Library/Sounds/Ping.aiff 2>/dev/null &
fi

exit 0
