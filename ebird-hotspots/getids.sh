#!/bin/sh

function makecleanfile(){
  cat clean.txt | head -n1 > montclean.txt
  while read line; do
    cat clean.txt | ag $line >> montclean.txt
  done < 10kmontpelierhotspotids.txt
}

makecleanfile
