# spec/ — Feature Specs

Individual units of work. Each spec is a self-contained proposal for a change to the system.

Specs move through folders like a kanban board:

```
backlog/  →  approved/  →  in-progress/  →  done/
```

## Rules

- Use `TEMPLATE.md` for new specs — run `/new-spec [description]` to auto-generate
- Name format: `NNN-short-slug.md` (e.g., `001-user-registration.md`)
- Specs must reference the requirements they implement (BR-NNN, CAP-NNN)
- Move the file between folders to track status — do not duplicate
- One spec per unit of work — keep them focused

## Subfolders

| Folder | Status | Meaning |
|--------|--------|---------|
| `backlog/` | Proposed | Written, not yet reviewed or approved |
| `approved/` | Ready | Reviewed and accepted, ready to start |
| `in-progress/` | Active | Currently being worked on |
| `done/` | Complete | Finished and verified against acceptance criteria |
