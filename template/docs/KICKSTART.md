# Kickstart Guide

This guide walks through bootstrapping a new project using the spec-driven methodology.
Follow each step in order. Answer the questions in 1-2 sentences each.
Write answers directly into the target file.

You don't need perfect answers — you need *something written* so the structure
isn't empty scaffolding. You can refine later.

Run `/kickstart` to walk through this interactively with Claude.

---

## Step 1: Project Brief (`docs/README.md`)

1. What is this project in plain language?
2. Who is it for?
3. What problem does it solve for them?
4. How will you know it's successful?

**Skip if:** Never. Every project needs this.

---

## Step 2: Glossary (`docs/reqs/GLOSSARY.md`)

1. What are the core domain terms someone new would need to understand?
2. Are there any terms that could be ambiguous or have multiple meanings?
3. Are there any acronyms or abbreviations used in this domain?

**Skip if:** The domain is trivial and uses only common programming terms.

---

## Step 3: Business Requirements (`docs/reqs/BUSINESS.md`)

1. What are the hard business rules that must always be true? (e.g., "an order total must never be negative")
2. What are the key constraints from the business side? (regulatory, legal, policy)
3. Who are the stakeholders and what does each care about most?

**Skip if:** Pure technical/infrastructure project with no business logic.

---

## Step 4: Functional Requirements (`docs/reqs/FUNCTIONAL.md`)

1. What are the main things a user can do with this system?
2. For each capability, what's the expected input and output?
3. Are there different user roles with different permissions?
4. What are the critical user journeys (happy path)?

**Skip if:** Never. Even a CLI tool or library has functional requirements.

---

## Step 5: Non-Functional Requirements (`docs/reqs/NON-FUNCTIONAL.md`)

1. What are the performance expectations? (response time, throughput)
2. What are the availability requirements? (uptime, recovery time)
3. Are there security requirements? (auth, encryption, compliance)
4. Are there scale expectations? (users, data volume, growth rate)

**Skip if:** Prototype, proof-of-concept, or personal tool with no production expectations.

---

## Step 6: Software Architecture (`docs/arch/SOFTWARE.md`)

1. What language and framework will you use, and why?
2. What are the main layers or modules?
3. What are the key interfaces/contracts between them?
4. What external services or APIs does this depend on?

**Skip if:** Never. Even a single-file script benefits from stating the technology choice.

---

## Step 7: Data Architecture (`docs/arch/DATA.md`)

1. What are the core entities and their relationships?
2. What is the primary data store, and why?
3. What are the key schemas or data shapes?
4. How does data flow through the system? (origin, transforms, destination)

**Skip if:** The project has no persistent data.

---

## Step 8: Infrastructure Architecture (`docs/arch/INFRASTRUCTURE.md`)

1. Where will this run? (local, cloud, edge, hybrid)
2. What environments are needed? (dev, staging, prod)
3. How does code get from commit to running? (CI/CD pipeline)
4. What infrastructure dependencies exist? (databases, queues, caches, CDNs)

**Skip if:** Single-machine tool or library with no deployment concerns.

---

## Step 9: Operations (`docs/ops/OPERATIONS.md`)

1. How do you know the system is healthy? (monitoring, health checks)
2. What are the common failure modes and how do you recover?
3. What does the deploy process look like?
4. Who gets alerted and when?

**Skip if:** Not yet approaching production. Revisit before launch.

---

## Step 10: AI Governance (`CLAUDE.md`)

1. What hard rules must the AI always follow on this project?
2. What naming conventions or patterns are mandatory?
3. What actions are explicitly forbidden?
4. What commands are used for dev, test, build, deploy?

**Skip if:** Never. This is the entry point for AI-assisted development.

---

## Step 11: Conventions (`docs/gov/CONVENTIONS.md`)

1. What's the commit message format?
2. What's the branch naming convention?
3. What coding style rules apply? (linting, formatting)
4. What naming patterns are used? (files, functions, variables, database objects)

**Skip if:** Solo project where you don't care about consistency. (You should still care.)

---

## Step 12: Workflow (`docs/gov/WORKFLOW.md`)

1. What phases does work go through? (backlog → approved → in-progress → done?)
2. What's the definition of done for a spec?
3. Is there a review or approval step?
4. How do you handle urgent/unplanned work?

**Skip if:** Never. Even "I just work on whatever" is a workflow — write it down.

---

## What's Next?

Once all files have minimum viable content:

1. Create your first spec: `/new-spec [what you're building first]`
2. Record any significant decisions made during kickstart as ADRs in `docs/gov/adr/`
3. Start building — always reference the docs, never guess
