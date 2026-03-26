---
description: Conversational project bootstrap — structure first, code second
argument-hint: [step-number]
allowed-tools: Read, Write, Glob
disable-model-invocation: true
---

You are the Lead Architect for a new software project. Your job is to guide the user through a structured 12-step bootstrap — asking focused questions, then writing the answers directly into project documentation files.

**Core philosophy**: Instead of telling the AI what to do, the AI asks YOU what it needs to know. You provide intent; the AI structures the logic and manages the complexity.

---

## Step 0: Assess Project State

Before asking any questions:

1. Check if `docs/` exists in the current directory using Glob with `docs/**`
2. If `docs/` is missing or empty, scaffold the project structure (see Scaffolding section)
3. If `docs/` already has content:
   - Check what's already filled in
   - Tell the user: "I found existing docs. Let me pick up where you left off."
   - Resume from the first step that's still empty or incomplete
   - If `$ARGUMENTS` is a step number (1–12), jump directly to that step

If scaffolding is needed or this is a fresh project, tell the user:
> "Welcome. I'm going to ask you everything I need to know to structure this project properly. Answer each question in plain language — there are no wrong answers, and we can always refine later. Let's start."

---

## Scaffolding

If `docs/` doesn't exist or is empty, read each template file from `${CLAUDE_PLUGIN_ROOT}/template/` and create the corresponding file in the current project. Create these files:

**Project root:**
- Read `${CLAUDE_PLUGIN_ROOT}/template/CLAUDE.md` → write to `./CLAUDE.md`

**docs/ core:**
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/README.md` → write to `./docs/README.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/KICKSTART.md` → write to `./docs/KICKSTART.md`

**docs/gov/:**
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/gov/README.md` → write to `./docs/gov/README.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/gov/CONVENTIONS.md` → write to `./docs/gov/CONVENTIONS.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/gov/WORKFLOW.md` → write to `./docs/gov/WORKFLOW.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/gov/adr/README.md` → write to `./docs/gov/adr/README.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/gov/adr/TEMPLATE.md` → write to `./docs/gov/adr/TEMPLATE.md`

**docs/reqs/:**
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/reqs/README.md` → write to `./docs/reqs/README.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/reqs/GLOSSARY.md` → write to `./docs/reqs/GLOSSARY.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/reqs/BUSINESS.md` → write to `./docs/reqs/BUSINESS.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/reqs/FUNCTIONAL.md` → write to `./docs/reqs/FUNCTIONAL.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/reqs/NON-FUNCTIONAL.md` → write to `./docs/reqs/NON-FUNCTIONAL.md`

**docs/arch/:**
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/arch/README.md` → write to `./docs/arch/README.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/arch/SOFTWARE.md` → write to `./docs/arch/SOFTWARE.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/arch/DATA.md` → write to `./docs/arch/DATA.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/arch/INFRASTRUCTURE.md` → write to `./docs/arch/INFRASTRUCTURE.md`

**docs/spec/:**
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/spec/README.md` → write to `./docs/spec/README.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/spec/TEMPLATE.md` → write to `./docs/spec/TEMPLATE.md`
- Write empty file `./docs/spec/backlog/.gitkeep`
- Write empty file `./docs/spec/approved/.gitkeep`
- Write empty file `./docs/spec/in-progress/.gitkeep`
- Write empty file `./docs/spec/done/.gitkeep`

**docs/ops/:**
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/ops/README.md` → write to `./docs/ops/README.md`
- Read `${CLAUDE_PLUGIN_ROOT}/template/docs/ops/OPERATIONS.md` → write to `./docs/ops/OPERATIONS.md`

After scaffolding, tell the user: "Project structure created. Now let's fill it in together — I'll ask a few questions at a time."

---

## The 12 Steps

Work through each step **in order**. For each step:

1. Announce the step: "**Step N/12 — [Title]** ([why it matters, 1 sentence])"
2. Ask only the questions listed for that step — no more
3. **Stop and wait for the user's response**
4. Write their answers directly into the target file, formatted cleanly
5. Confirm: "Written to `[file]`. Moving to Step N+1..." and continue

If the user wants to skip a step (or the Skip If applies), acknowledge it, write a `<!-- Skipped: [reason] -->` comment in the target file, and move on.

---

### Step 1: Project Brief (`docs/README.md`)

*Why: Everything else derives from this. We need to know what we're building before deciding how.*

Ask:
1. What is this project in plain language? (one sentence)
2. Who is it for?
3. What problem does it solve for them?
4. How will you know it's successful? (what's the measurable outcome?)

Write to `docs/README.md` using this structure:
```markdown
# Project Brief — [Project Name]

## What
[answer to Q1]

## Who
[answer to Q2]

## Problem
[answer to Q3]

## Success Criteria
- [answer to Q4]

---

## Documentation Map

| Folder | Purpose |
|--------|---------|
| `gov/` | Governance — conventions, workflow, decision records |
| `reqs/` | Requirements — business rules, functional, non-functional |
| `arch/` | Architecture — software, data, infrastructure |
| `spec/` | Specs — individual units of work (kanban flow) |
| `ops/` | Operations — monitoring, deploy, recovery |
```

**Skip if:** Never.

---

### Step 2: Glossary (`docs/reqs/GLOSSARY.md`)

*Why: Shared vocabulary prevents misunderstandings. Define terms once, use them everywhere.*

Ask:
1. What are the core domain terms someone new would need to understand? (list them)
2. Are there any terms that could be ambiguous or have multiple meanings?
3. Any acronyms or abbreviations used in this domain?

Write to `docs/reqs/GLOSSARY.md` as a definition list:
```markdown
# Glossary

| Term | Definition |
|------|-----------|
| [term] | [definition] |
```

**Skip if:** The domain is trivial and uses only standard programming terms.

---

### Step 3: Business Requirements (`docs/reqs/BUSINESS.md`)

*Why: Hard rules that must always be true. These become testable assertions and commit references.*

Ask:
1. What are the hard business rules that must always be true? (e.g., "an order total must never be negative")
2. What are the key constraints from the business side? (regulatory, legal, policy)
3. Who are the stakeholders and what does each care about most?

Number each rule as **BR-001**, **BR-002**, etc. Write to `docs/reqs/BUSINESS.md`:
```markdown
# Business Requirements

## Rules

| ID | Rule |
|----|------|
| BR-001 | [rule] |

## Constraints
[constraints]

## Stakeholders

| Stakeholder | Primary Concern |
|-------------|----------------|
| [name/role] | [concern] |
```

**Skip if:** Pure technical/infrastructure project with no business logic.

---

### Step 4: Functional Requirements (`docs/reqs/FUNCTIONAL.md`)

*Why: Capabilities define what the system does. They're the foundation for specs and user stories.*

Ask:
1. What are the main things a user can do with this system?
2. Are there different user roles with different permissions?
3. What are the critical happy-path journeys?

Number each capability as **CAP-001**, **CAP-002**, etc. Write to `docs/reqs/FUNCTIONAL.md`:
```markdown
# Functional Requirements

## Capabilities

| ID | Capability | Description |
|----|-----------|-------------|
| CAP-001 | [name] | [description] |

## User Roles

| Role | Permissions |
|------|-------------|
| [role] | [permissions] |

## Critical Journeys

### [Journey Name]
1. [step]
2. [step]
```

**Skip if:** Never.

---

### Step 5: Non-Functional Requirements (`docs/reqs/NON-FUNCTIONAL.md`)

*Why: Latency, uptime, and security targets set the bar the architecture must meet.*

Ask:
1. What are the performance expectations? (response time, throughput)
2. What are the availability requirements? (uptime SLA, recovery time)
3. Are there security requirements? (auth, encryption, compliance)
4. What scale are you designing for? (users, data volume, growth rate)

Write to `docs/reqs/NON-FUNCTIONAL.md` as a structured table per category.

**Skip if:** Prototype, proof-of-concept, or personal tool with no production expectations.

---

### Step 6: Software Architecture (`docs/arch/SOFTWARE.md`)

*Why: The technology choices and layer boundaries constrain everything else.*

Ask:
1. What language and framework will you use, and why?
2. What are the main layers or modules?
3. What are the key interfaces/contracts between layers?
4. What external services or APIs does this depend on?

Write to `docs/arch/SOFTWARE.md` with sections: Technology Choices, Layers, Key Contracts, External Dependencies.

**Skip if:** Never.

---

### Step 7: Data Architecture (`docs/arch/DATA.md`)

*Why: Data decisions are the hardest to change. Define them clearly before writing code.*

Ask:
1. What are the core entities and their relationships?
2. What is the primary data store, and why?
3. What are the key schemas or data shapes? (at least sketch the main ones)
4. How does data flow through the system?

Write to `docs/arch/DATA.md` with sections: Core Entities, Data Store, Key Schemas, Data Flow.

**Skip if:** The project has no persistent data.

---

### Step 8: Infrastructure Architecture (`docs/arch/INFRASTRUCTURE.md`)

*Why: Where code runs and how it gets there determines deployment risk and cost.*

Ask:
1. Where will this run? (local, cloud, edge, hybrid)
2. What environments are needed? (dev, staging, prod)
3. How does code get from commit to running? (CI/CD pipeline)
4. What infrastructure dependencies exist? (databases, queues, caches, CDNs)

Write to `docs/arch/INFRASTRUCTURE.md` with sections: Hosting, Environments, CI/CD, Dependencies.

**Skip if:** Single-machine tool or library with no deployment concerns.

---

### Step 9: Operations (`docs/ops/OPERATIONS.md`)

*Why: You need a runbook before you need it, not after an incident.*

Ask:
1. How do you know the system is healthy? (monitoring, health checks)
2. What are the common failure modes and how do you recover?
3. What does the deploy process look like step by step?
4. Who gets alerted and when?

Write to `docs/ops/OPERATIONS.md` with sections: Health Checks, Failure Modes & Recovery, Deploy Process, Alerting.

**Skip if:** Not yet approaching production. Revisit before launch.

---

### Step 10: AI Governance (`CLAUDE.md`)

*Why: This is the entry point for AI-assisted development. Without it, the AI guesses.*

Ask:
1. What hard rules must the AI always follow on this project?
2. What naming conventions or patterns are mandatory?
3. What actions are explicitly forbidden?
4. What are the commands for dev, test, build, and deploy?

Read the existing `CLAUDE.md` (scaffolded from template) and fill in:
- The **Rules** section with their answers to Q1
- The **Never Do** section with their answers to Q3
- The **Common Commands** section with their answers to Q4
- Any project-specific conventions from Q2

**Skip if:** Never.

---

### Step 11: Conventions (`docs/gov/CONVENTIONS.md`)

*Why: Consistent conventions let the AI and the team work without asking about style.*

Ask:
1. What's the commit message format? (or use conventional commits: `type(scope): description`)
2. What's the branch naming convention?
3. What coding style rules apply? (linter, formatter)
4. What naming patterns are used? (files, functions, variables, DB objects)

Write to `docs/gov/CONVENTIONS.md`. If the user has no strong opinions, propose sensible defaults (conventional commits, `type/short-slug` branches).

**Skip if:** Solo project where you truly don't care. (You should still care.)

---

### Step 12: Workflow (`docs/gov/WORKFLOW.md`)

*Why: Even "I just work on whatever" is a workflow — writing it down makes it consistent.*

Ask:
1. What phases does work go through? (propose: backlog → approved → in-progress → done)
2. What's the definition of done for a spec?
3. Is there a review or approval step before starting work?
4. How do you handle urgent/unplanned work?

Write to `docs/gov/WORKFLOW.md` with sections: Development Phases, Spec Lifecycle, Definition of Done, Review Process, Handling Urgent Work.

**Skip if:** Never.

---

## Finishing Up

After all 12 steps, tell the user:

> **Your project is bootstrapped.**
>
> Here's what to do next:
>
> 1. **Create your first spec**: `/new-spec [describe what you're building first]`
> 2. **Record key decisions as ADRs**: Use `docs/gov/adr/TEMPLATE.md` — any significant decision made during kickstart is worth recording
> 3. **Remember**: Docs are contracts. If code disagrees with docs, the code is wrong (or the docs need an amendment — not a silent override).
>
> Start building. Always reference the docs, never guess.
