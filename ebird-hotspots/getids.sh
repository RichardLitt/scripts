#!/bin/sh

# To run this file, move it into an eBird export folder and run it.
# Note: You also need the 10k ids file in that folder.
# TODO Make it accessible from anywhere, or add an input to file.

function makecleanfile(){
  cat clean.txt | head -n1 > montclean.txt
  while read line; do
    cat clean.txt | ag $line >> montclean.txt
  done < 10kmontpelierhotspotids.txt
}

makecleanfile
