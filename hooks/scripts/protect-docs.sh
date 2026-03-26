#!/bin/bash
# Hook: Remind Claude to update cross-references when editing docs/ files.
# Fires as a PreToolUse hook on Edit|Write.
#
# When a docs/ file is being modified, injects a reminder to:
# - Keep BR-NNN, CAP-NNN, ADR-NNN references valid
# - Update any cross-references affected by the change

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

if [[ "$FILE_PATH" == *"/docs/"* ]] || [[ "$FILE_PATH" == */CLAUDE.md ]]; then
  echo '{"hookSpecificOutput":{"hookEventName":"PreToolUse","additionalContext":"REMINDER: You are editing a documentation file. Per methodology rules: (1) Never modify docs without updating cross-references. (2) Verify that any BR-NNN, CAP-NNN, or ADR-NNN references in this file remain valid after your edit. (3) If you are renumbering or removing a rule, search all other docs/ files for references to the old ID and update them."}}'
fi

exit 0
