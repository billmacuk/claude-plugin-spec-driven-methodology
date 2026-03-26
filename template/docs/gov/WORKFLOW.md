# Workflow

<!-- Fill in during kickstart Step 12 -->

## Development Phases

Work follows a natural progression. Each phase has a primary lens:

| Phase | Primary Lens | Activity |
|-------|-------------|----------|
| 1. Inception | Governance | Establish rules, conventions, process |
| 2. Definition | Requirements | Define what the system must do |
| 3. Design | Architecture | Define how the system is structured |
| 4. Implementation | Functional (Specs) | Build features against specs |
| 5. Pre-launch | Operational | Monitoring, deploy, recovery |
| 6. Maintenance | Functional + Operational | Ongoing specs and operational care |

## Spec Lifecycle

Specs move through folders like a kanban board:

```
backlog/  →  approved/  →  in-progress/  →  done/
```

- **backlog/** — Proposed work, not yet reviewed
- **approved/** — Reviewed and accepted, ready to start
- **in-progress/** — Actively being worked on
- **done/** — Completed and verified

## Definition of Done

A spec is done when:

- [ ] All acceptance criteria are met
- [ ] Tests pass and cover all stated business rules
- [ ] Code follows conventions in `CONVENTIONS.md`
- [ ] Any new decisions are captured as ADRs
- [ ] Relevant docs are updated (architecture, operations, etc.)

## Review Process

> TODO: Define who approves specs and reviews completed work.

## Handling Urgent Work

- Hotfixes use an abbreviated process: a minimal spec can be written after the fix
- Still requires a spec, but it can be written retroactively
- Post-incident review recommended for production issues
