---
name: check-docs
description: Run a documentation consistency check across all project docs. Use when you want to verify cross-references, business rule coverage, glossary consistency, and structural completeness. Triggers on phrases like "check docs", "audit documentation", "are the docs consistent", "doc health check".
version: 1.0.0
user-invocable: true
context: fork
agent: doc-checker
argument-hint: "[focus-area]"
---

Run the doc-checker agent to audit documentation consistency.

If an argument is provided, focus the audit on that area: `$ARGUMENTS`

Valid focus areas: `business-rules`, `capabilities`, `glossary`, `adrs`, `specs`, `dead-references`, `structure`

If no argument is provided, run all checks and return a full health report.
