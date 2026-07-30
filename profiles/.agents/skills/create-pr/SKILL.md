---
name: create-pr
description: >-
  Create a GitHub PR while automatically obeying repo CONTRIBUTING guidance, templates, and branch rules.
---

## What I do

- verify GitHub CLI readiness and git state
- discover CONTRIBUTING or docs/CONTRIBUTING instructions, including required base branch, template, labels, and section guidance
- build a PR body that satisfies `.github/pull_request_template.md` when present or fall back to the repo-approved default template, keeping every section and applying `Tasks Resolved` rules
- confirm branch is pushed, resolve base branch (explicit instruction > repo default via `gh repo view`), and run `gh pr create --base "$BASE_BRANCH" --head "$CURRENT_BRANCH" --title "<clear title>" --body "<templated body>"`
- summarize the resulting PR link and any post-creation manual requirements (labels, changelog, test jobs)

## When to use me

Use this skill whenever you need to open a PR. It automatically follows repo policy for templates, base branches, and checklist items. If the repo lacks instructions, it safely uses the provided default template and asks the user to confirm defaults before executing commands.

## Workflow

1. **Prerequisites** – run `gh --version` and `gh auth status`; if `gh` is missing or unauthenticated, guide the user through install/auth (`brew install gh`, Linux instructions, `winget`/`choco`, then `gh auth login`) and wait for their confirmation before continuing. Ensure the git repo is clean enough for a PR.
2. **Discover rules** – look for `CONTRIBUTING.md` in root or `docs/CONTRIBUTING.md`, follow any referenced docs, and parse them for: required base branch, template path, label/check instructions, and PR body expectations. If nothing specifies the base branch, call `gh repo view --json defaultBranchRef --jq '.defaultBranchRef.name'` for the default.
3. **Analyze branch** – set `CURRENT_BRANCH=$(git branch --show-current)`, ensure it is not the base branch, and review diffs (`git log --oneline "origin/$BASE_BRANCH"..HEAD` etc.). Check `git status` and `git log --oneline @{u}..HEAD` to confirm commits are pushed; if not, offer to `git push -u origin "$CURRENT_BRANCH"` before PR creation.
4. **Template enforcement** – prefer `.github/pull_request_template.md` or the template referenced in contributing docs. Keep every section; write `N/A` when sections cannot be filled, obey inline guidance, and enforce the Tasks Resolved rules (check only completed items, strike through and check non-applicable tasks). If no template exists, use the default below.

   **Observations section:** Default to `N/A`. Only include content if it is a genuinely notable finding that does not belong in any other section (e.g., performance regression, flaky test, uncovered edge case worth flagging). Never fill with trivial observations about code style, commits being clean, or normal workflow.
5. **Draft body** – summarize motivation, approach, testing, task coverage, and observations based on diffs/commits. Note required labels or reviewers per docs so the user can apply them if `gh pr create` can’t.
6. **Create PR** – run the determined `gh pr create` command with resolved base/head/title/body. Use a heredoc-based body injection to avoid quoting issues, for example:

   ```bash
   gh pr create --base "$BASE_BRANCH" --head "$CURRENT_BRANCH" --title "$PR_TITLE" \
     --body "$(cat <<'EOF'
   ...templated body...
   EOF
   )"
   ```

   Attach labels/reviewers/projects if mandated. After creation, return the PR URL and remind the user of any remaining manual steps.

## Fallback template

Use the `template.md` file in this directory when the repo provides no pull request template. Keep every section and comply with the checklist rules.

## Reminders

- Never remove sections from the chosen template; keep them visible and fill with `NA` if necessary.
- Follow repo-specific PR rules before falling back to defaults.
- Tasks Resolved: check items only when done; strike-through non-applicable items but still mark as `[x]`.
- Always verify the resolved base branch matches CONTRIBUTING instructions or the repo default before running `gh pr create`.
