#!/usr/bin/env bash

export GH_PAGER=""

# Optional first argument: cutoff date in ISO format (YYYY-MM-DD)
CUTOFF_DATE="${1:-$(date -d '6 days ago' +%Y-%m-%d)}"

repos=(
    addvolt/dashboard
    addvolt/api
    addvolt/task-engine
    addvolt/data-api
    addvolt/ali
    addvolt/data-listener-v3
    addvolt/data-listener-v25
)

for repo in "${repos[@]}"; do
    gh pr list -R "$repo" \
        --state merged \
        --base development \
        --limit 30 \
        --json title,author,mergedAt,url \
        --jq '.[] 
          | select(.mergedAt >= "'"$CUTOFF_DATE"'") 
          | "'"$repo"' | \(.author.login) | \(.mergedAt) | \(.url) | \(.title)"'
done
