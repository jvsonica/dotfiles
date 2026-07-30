---
name: research-1-3-1
description: >-
  Guides the AI through a structured 1-3-1 problem-solving workflow:
  refine 1 problem statement, research 3 distinct approaches,
  deliver 1 recommended solution. Uses any available MCP tools
  and skills (find-docs, web search, Atlassian, file system, etc.)
  to gather information -- no tools are assumed, all are opportunistic.
---

## What I do

- Lead the user through a structured 1-3-1 research process for any kind of problem
- First, interview the user to narrow down the real problem and capture constraints
- Then, gather information using whatever tools and skills are available
- Explore 3 distinct approaches with tradeoffs
- Recommend and deliver 1 solution (code, architecture, config, doc, plan — whatever fits)

## Required workflow

### 1. Clarify and refine the problem (the "1")

Interview the user to produce a concise problem statement covering:

- **What** — the actual problem or goal (not the assumed solution)
- **Who** — stakeholders, audience, or users
- **Why** — motivation, impact, priority
- **Constraints** — tech stack, time, budget, compliance, existing commitments
- **Already tried** — what has been explored or ruled out
- **Missing information** — what you don't know yet and which tool/skill could fill it

Confirm the problem statement with the user before proceeding.

**Skip to delivery** if the problem is trivially small (< 5 min to solve). Explain briefly why the full 1-3-1 is unnecessary and solve it directly.

### 2. Gather information

Use every relevant tool and skill available in the current session:

- **`find-docs` skill** — library/framework/SDK documentation
- **`websearch` + `webfetch`** — broader internet research, current events, blog posts
- **Atlassian MCP** — Jira issues, Confluence pages, past decisions
- **File system tools** — explore the existing codebase for context
- **`bash`** — run repo-local commands to understand the environment

Synthesize findings in a way that maps to the 3 approaches you will explore.

### 3. Explore 3 distinct approaches (the "3")

Investigate 3 viable solutions. For each, cover:

- **Approach name** — short, descriptive label
- **How it works** — brief technical or process description
- **Pros** — strengths, why you would pick this
- **Cons** — weaknesses, risks, when it falls short
- **Effort estimate** — rough sense (hours/days/weeks or small/medium/large)
- **Key unknowns** — what you would need to validate

Present the 3 options to the user and get explicit direction (or agreement to proceed with your recommendation) before moving on.

### 4. Recommend and deliver (the "1")

- State your recommendation clearly with rationale
- Implement, document, produce, or report the solution as appropriate to the problem type
- Summarize what was done and any follow-up items (risks, future work, open questions)

## Guardrails

- Always confirm the problem statement with the user before moving to research
- Always present the 3 options and wait for user input before committing to one
- If the problem is trivially small, skip the full workflow and solve directly — explain why
- If critical information is missing and no available tool can fill the gap, flag it explicitly
- Do not assume any specific tool or skill is available — check for availability and adapt
- When using external tools (search, fetch, etc.), respect rate limits and authentication constraints
