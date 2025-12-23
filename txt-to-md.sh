#!/usr/bin/env sh

set -eu

DIR="${1:-.}"

if [ ! -d "$DIR" ]; then
  echo "Error: '$DIR' is not a directory" >&2
  exit 1
fi

for file in "$DIR"/*.txt; do
  # If no .txt files exist, the glob is literal
  [ -e "$file" ] || continue

  base="${file%.txt}"
  target="${base}.md"

  mv -- "$file" "$target"
done
