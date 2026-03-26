# claude-plugin-spec-driven-methodology

> Stop telling your AI what to do. Start letting it tell YOU what it needs.

A [Claude Code](https://claude.ai/claude-code) plugin that installs a complete **spec-driven, inversion-of-control** methodology into any new project. Structure first, code second.

The AI acts as Lead Architect — asking you what it needs to know, then scaffolding and populating your entire project documentation structure. You provide intent; the AI structures the logic.

## Philosophy

Instead of using the AI as a code generator, use it as a Lead Architect that designs the specification framework it needs to be successful. The human provides intent and context; the AI structures the logic and manages the complexity.

**Five lenses for viewing a system:**

| Lens | Question | When It Leads |
|------|----------|---------------|
| Governance | How do we build it? | First — before any other docs |
| Requirements | What must it do? | Project definition phase |
| Architecture | How is it structured? | Design phase, major refactors |
| Functional (Specs) | What are we building next? | Active development |
| Operational | How does it run? | Pre-launch, production |

## Getting Started

In any new project, run:

```
/kickstart
```

The AI will ask you everything it needs to know, then scaffold and populate your entire `docs/` structure.

## Commands

| Command | Description |
|---------|-------------|
| `/kickstart` | Conversational bootstrap — walks through all 12 setup steps |
| `/new-spec [description]` | Create a new spec in the backlog |
| `/br-check [file]` | Verify business rule coverage for a file or spec |
| `/check-docs [area]` | Run full documentation consistency audit |

## What Gets Installed

When you run `/kickstart`, your project gets:

```
docs/
├── README.md              # Project brief
├── KICKSTART.md           # Bootstrap reference
├── gov/                   # Governance
│   ├── CONVENTIONS.md     # Commit format, naming, style
│   ├── WORKFLOW.md        # Phases, definition of done
│   └── adr/               # Architecture Decision Records
├── reqs/                  # Requirements
│   ├── GLOSSARY.md        # Domain terms
│   ├── BUSINESS.md        # Business rules (BR-NNN)
│   ├── FUNCTIONAL.md      # Capabilities (CAP-NNN)
│   └── NON-FUNCTIONAL.md  # Performance, security, scale
├── arch/                  # Architecture
│   ├── SOFTWARE.md        # Code structure, layers, contracts
│   ├── DATA.md            # Domain model, schemas, storage
│   └── INFRASTRUCTURE.md  # Environments, CI/CD, compute
├── spec/                  # Feature specs (kanban flow)
│   ├── backlog/
│   ├── approved/
│   ├── in-progress/
│   └── done/
└── ops/                   # Operations
    └── OPERATIONS.md
CLAUDE.md                  # AI governance (project root)
```

## Agents

- **spec-writer** — Drafts specs in the correct format, referencing business rules and capabilities
- **doc-checker** — Audits documentation for consistency, dead references, and coverage gaps

## Hooks

- **protect-docs** — Reminds Claude to update cross-references whenever a `docs/` file is edited

## Key Principles

- **Docs are contracts** — if code disagrees with docs, the code is wrong
- **Number your rules** — BR-001, CAP-003, ADR-007 — so they're referenceable everywhere
- **Test against specs** — each business rule maps to at least one test
- **ADRs are immutable** — supersede with a new ADR, never edit an old one
- **Minimum viable answers** — the kickstart doesn't demand perfection, just something written

## Prerequisites

- [Claude Code](https://claude.ai/claude-code) installed and running
- Claude Code version that supports plugins (check with `/version`)

## Installation

**Option 1: Per-project** (recommended — keeps the methodology version-controlled with your project)

```bash
# From your project root
git clone https://github.com/billmc-chambers/claude-plugin-spec-driven-methodology \
  .claude/plugins/claude-plugin-spec-driven-methodology
```

**Option 2: Global** (available in all your Claude Code sessions)

```bash
git clone https://github.com/billmc-chambers/claude-plugin-spec-driven-methodology \
  ~/.claude/plugins/claude-plugin-spec-driven-methodology
```

Then enable it in Claude Code:

1. Open Claude Code settings (`/settings` or the settings icon)
2. Find the plugin in the Plugins section
3. Enable `spec-driven-methodology`
4. Run `/kickstart` in your project

## Example Session

```
You:    /kickstart

Claude: Welcome. I'm going to ask you everything I need to know to
        structure this project properly. Let's start.

        Step 1/12 — Project Brief
        Everything else derives from this. I need to understand what
        we're building before deciding how.

        1. What is this project in plain language?
        2. Who is it for?
        3. What problem does it solve for them?
        4. How will you know it's successful?

You:    It's a SaaS app that lets customers deploy MCP proxy servers
        for their websites. For developers who need MCP infrastructure
        without building it themselves. Success = customers can
        configure and deploy an MCP proxy through the UI.

Claude: Written to docs/README.md. Moving to Step 2/12 — Glossary...
```

After all 12 steps, your `docs/` folder is fully scaffolded and populated. Then:

```
/new-spec add user authentication with email and password
/br-check docs/spec/backlog/001-user-auth.md
/check-docs
```

## Contributing

This methodology was developed collaboratively and is designed to evolve. Contributions welcome:

- **Issues** — bugs, unclear instructions, missing edge cases
- **PRs** — improvements to the kickstart flow, new template content, hook enhancements
- **Discussion** — ideas for new lenses (temporal, adversarial) or workflow patterns

## Origin

This plugin packages a spec-driven development methodology synthesised from established practices:

| Practice | Origin |
|----------|--------|
| Architecture Decision Records | Michael Nygard, ~2011 |
| Numbered business rules → tests | BDD / Specification by Example (Gojko Adzic) |
| Schema-in-docs as authoritative | Design-first / API-first (OpenAPI, contract-driven design) |
| Commit format `type(scope): desc` | Conventional Commits spec |
| Spec kanban workflow | RFC processes (Google, Uber, Rust RFC) |
| CLAUDE.md as AI instructions | Claude Code convention (Anthropic) |

Closest single book to the overall approach: Gojko Adzic's *Specification by Example*.

## License

MIT
