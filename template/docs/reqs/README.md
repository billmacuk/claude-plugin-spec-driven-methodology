# reqs/ — Requirements

What the system must do.

## Contents

| File | Purpose |
|------|---------|
| `GLOSSARY.md` | Domain terms defined once, used everywhere |
| `BUSINESS.md` | Business rules (BR-NNN) — hard constraints that must always be true |
| `FUNCTIONAL.md` | Capabilities (CAP-NNN) — what the system can do |
| `NON-FUNCTIONAL.md` | Performance, security, scale, availability targets |

## Dependency Order

Requirements flow from most stable to least stable:

```
BUSINESS.md  →  FUNCTIONAL.md  →  NON-FUNCTIONAL.md
(why)            (what)             (how well)
```

Everything in `arch/` and `spec/` derives from these files.
