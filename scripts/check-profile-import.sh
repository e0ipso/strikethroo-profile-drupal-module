#!/usr/bin/env bash
# Imports this profile into an empty workspace with the locked strikethroo
# version, then checks that every file under config/ arrived unchanged.
set -euo pipefail

repo_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
workspace=$(mktemp -d)
trap 'rm -rf "$workspace"' EXIT

npx --no -- strikethroo init \
  --harnesses claude \
  --profile "$repo_root" \
  --destination-directory "$workspace" </dev/null

status=0
while IFS= read -r -d '' file; do
  relative=${file#"$repo_root/config/"}
  installed="$workspace/.ai/strikethroo/config/$relative"
  if ! cmp -s "$file" "$installed"; then
    echo "✗ config/$relative was not installed unchanged" >&2
    status=1
  fi
done < <(find "$repo_root/config" -type f -print0)

if [ "$status" -eq 0 ]; then
  echo "✓ Every file under config/ was installed unchanged"
fi
exit "$status"
