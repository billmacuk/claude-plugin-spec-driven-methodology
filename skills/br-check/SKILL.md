---
name: br-check
description: Verify that a code change, spec, or file correctly implements and references all relevant business rules. Use before committing or when reviewing specs. Triggers on phrases like "check business rules", "verify BR coverage", "does this follow the rules".
version: 1.0.0
user-invocable: true
allowed-tools: Read, Grep, Glob
argument-hint: "[file-or-spec-path]"
---

## Business Rule Verification

Check whether the given file or spec correctly implements and references business rules.

### Steps

1. Identify the target: `$ARGUMENTS` (if empty, check the most recently edited file)
2. Read the target file
3. Read `docs/reqs/BUSINESS.md` to get all business rules (BR-NNN)
4. Identify which business rules are relevant to the target based on its content and domain
5. For each relevant rule, verify:
   - Is it referenced by ID (BR-NNN) in the file?
   - Is it correctly implemented or accounted for?
   - Does the spec have acceptance criteria or test notes that cover it?
6. Report findings

### Output Format

```
## BR Check: [filename]

### Relevant Business Rules
| ID | Rule | Status | Notes |
|----|------|--------|-------|
| BR-001 | [rule text] | ✅ Referenced | |
| BR-002 | [rule text] | ❌ Missing | Should be referenced in acceptance criteria |

### Summary
- Rules checked: N
- Passing: N
- Missing: N
- [Overall verdict]
```

If no business rules apply to the target, say so explicitly rather than leaving the section empty.
