#!/bin/sh

# To run this file, move it into an eBird export folder and run it.
# Note: You also need the 10k ids file in that folder.
# TODO Make it accessible from anywhere, or add an input to file.

# $ sh getids.sh WilliamstownIds.txt

IDS="$1"
CLEANFILE="${1%.txt}-clean.txt"

function makecleanfile() {
  cat ebd_US-VT_relAug-2023_clean.txt | head -n1 > $CLEANFILE
  while read line; do
    cat ebd_US-VT_relAug-2023_clean.txt | ag $line >> $CLEANFILE
  done < $IDS
}

makecleanfile
