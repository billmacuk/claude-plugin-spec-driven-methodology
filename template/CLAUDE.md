# CLAUDE.md

## Mandatory Reads

Before any work session, read these documents in order:

1. `docs/README.md` — Project brief
2. `docs/reqs/GLOSSARY.md` — Domain terminology
3. `docs/reqs/BUSINESS.md` — Business rules
4. `docs/gov/CONVENTIONS.md` — Coding and naming standards
5. `docs/gov/WORKFLOW.md` — Development process

## Bootstrap

When asked to bootstrap or kickstart this project, run `/kickstart`.

## Rules

- Never guess — if a requirement, schema, or contract is not defined in docs/, ask.
- Reference business rules by number (BR-001) in commits, tests, and code comments.
- Every business rule must map to at least one test.
- Specs must reference the requirements they implement.
- ADRs are immutable — supersede with a new ADR, never edit an old one.
- If code disagrees with docs, the docs are authoritative (or the docs need an amendment, not a silent override).

## Conventions

- Commit format: `type(scope): description` (see `docs/gov/CONVENTIONS.md`)
- Branch naming: see `docs/gov/CONVENTIONS.md`
- Spec naming: `NNN-short-slug.md` (see `docs/spec/TEMPLATE.md`)
- ADR naming: `ADR-NNN-short-slug.md` (see `docs/gov/adr/TEMPLATE.md`)

## Common Commands

```
dev:
test:
lint:
build:
deploy:
```

> TODO: Fill in during kickstart (Step 10)

## Never Do

- Never modify docs without updating cross-references
- Never skip the spec process for non-trivial changes
- Never commit secrets, credentials, or .env files
