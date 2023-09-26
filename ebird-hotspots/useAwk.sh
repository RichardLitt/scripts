#!/bin/bash

if [[ $# -lt 3 ]]; then
    echo "Usage: $0 <ID file> <clean source file> <target directory>"
    exit 1
fi

IDS="$1"
CLEAN_SRC="$2"
TARGET_DIR="$3"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: Target directory $TARGET_DIR does not exist!"
    exit 1
fi

cd "$TARGET_DIR"
CLEANFILE="${IDS%.txt}-clean-awk.txt"

# Use awk to perform the filtering
awk '
  NR==FNR {ids[$0] = 1; next}
  FNR==1 {
    print;
    next;
  }
  {
    for (id in ids) {
      if (index($0, id) > 0) {
        print;
        next;
      }
    }
  }
' "$IDS" "$CLEAN_SRC" > "$CLEANFILE"
