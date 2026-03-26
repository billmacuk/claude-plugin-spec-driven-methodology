# arch/ — Architecture

How the system is structured. These docs describe the system as a noun — its shape, relationships, and constraints.

## Contents

| File | Purpose |
|------|---------|
| `SOFTWARE.md` | Code structure, layers, contracts, patterns |
| `DATA.md` | Domain model, schemas, storage, data flow |
| `INFRASTRUCTURE.md` | Environments, compute, CI/CD, config |

## Change Frequency

| Sub-Category | Changes With |
|-------------|-------------|
| Software | Every significant feature |
| Data | Schema changes, domain model evolution |
| Infrastructure | Environment changes, new services, CI/CD updates |

Significant architectural decisions should be captured as ADRs in `gov/adr/`.
