---
name: new-spec
description: Create a new spec in the backlog. Use when the user wants to define a new unit of work, feature, or change. Triggers on phrases like "write a spec for", "create a spec", "add to backlog", "spec out".
version: 1.0.0
user-invocable: true
context: fork
agent: spec-writer
argument-hint: "<feature description>"
---

Create a new spec for the following feature:

$ARGUMENTS

Ask the user clarifying questions if the feature description is too vague to write testable acceptance criteria. Ask all questions at once before drafting — don't interrupt mid-draft.
