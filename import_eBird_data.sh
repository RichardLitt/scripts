#!/usr/bin/env bash

cd /Users/richard/Downloads/
filename=$(ls -Artl ebd_US-VT_rel* | grep ":$" | tail -n1 | tr -d ':')

if [ $# -eq 0 ]
then
    echo "No arguments supplied."
    echo "Proper arguments are: unzip, import."
elif [ $1 == "unzip" ]
then
  # May need to manually unzip first
  cd /Users/richard/Downloads/
  file=$(ls -Art ebd_US-VT_rel*.zip | tail -n1)
  unzip $file -d ${file%.*}
elif [ $1 == "import" ]
then
  # Assume it is always in downloads
  cd $filename
  echo "Importing the folder: ${filename}."
  echo "Creating a clean file without quotes..."
  sed "s/'//g" ebd_US-VT_rel*.txt > nodouble.txt
  sed 's/"//g' nodouble.txt > clean.txt
  rm nodouble.txt

  TEXT=$(cat clean.txt| head -n1)

  echo "Creating files..."
  mkdir counties

  for i in $(seq -f "%03g" 1 2 28); do
    echo "$TEXT" > counties/$i.txt
  done

  echo "Splitting files..."

  for i in $(seq -f "%03g" 1 2 28); do
    cat clean.txt | ag US-VT-$i >> counties/$i.txt
    echo "Split into files for county #$i"
  done

  echo "Done splitting files."
elif [ $1 == "convert" ]
then
  echo "Converting to JSON entries per region..."
  cd /Users/richard/src/birding/birdinginvermont.com/src/ebird-ext/shimeBirdData/
  node readEBirdDb.js regions '/Users/richard/Downloads/'$filename'/counties/005.txt'
  # for i in $(seq -f "%03g" 1 2 28); do
  # done
  echo "Munging them all together..."
  node joinTownJson.js regions
  echo "Moving all region files to $regionFolder..."
  regionFolder='/Users/richard/Downloads/'$filename'/regions'
  mkdir $regionFolder
  mv vtRegions-*.json $regionFolder'/.'
  echo "Done!"
fi
