#!/usr/bin/env bash
set -euo pipefail

payload="$(cat)"
payload_lower="$(printf '%s' "$payload" | tr '[:upper:]' '[:lower:]')"

if ! printf '%s' "$payload_lower" | grep -qE 'made with (\[[^]]*cursor\]|cursor)'; then
  echo '{"decision":"allow"}'
  exit 0
fi

# Strip "made with cursor" from tool_input and allow with modified payload
if command -v jq &>/dev/null; then
  updated_input="$(printf '%s' "$payload" | jq -c '
    .tool_input | walk(
      if type == "string" then
        gsub("(?i)made with \\[cursor\\]\\([^)]*\\)|made with \\[cursor\\]|made with cursor"; "")
      else . end
    )
  ')"
  echo "{\"decision\":\"allow\",\"updated_input\":$updated_input}"
else
  echo '{"decision":"deny","reason":"Policy: Do not add \"Made with [Cursor]\" (or \"Made with Cursor\") to code, commits, or PR text. Install jq to auto-strip."}'
  exit 0
fi
