#!/usr/bin/env bash

# TODO Grab name of ebd database automatically
cd /Users/richard/Downloads/ebd_US-VT_relJan-2022/
echo "Creating a clean file without quotes..."
sed "s/'//g" ebd_US-VT_relJan-2022.txt > nodouble.txt
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

echo "Converting to JSON entries per region..."

cd /Users/richard/src/birding/birdinginvermont.com/src/ebird-ext/shimeBirdData/
# TODO I'm not sure where this will print out files at the moment
for i in $(seq -f "%03g" 1 2 28); do
  # TODO test? Should do this for each number, as above.
  node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/'$i'.txt'
done

echo "Munging them all together..."

# TODO This certainly won't print them in the right place
node joinTownJson.js

echo "Done!"


