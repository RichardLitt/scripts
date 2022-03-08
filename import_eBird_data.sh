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

echo "$TEXT" > counties/001.txt
echo "$TEXT" > counties/003.txt
echo "$TEXT" > counties/005.txt
echo "$TEXT" > counties/007.txt
echo "$TEXT" > counties/009.txt
echo "$TEXT" > counties/011.txt
echo "$TEXT" > counties/013.txt
echo "$TEXT" > counties/015.txt
echo "$TEXT" > counties/017.txt
echo "$TEXT" > counties/019.txt
echo "$TEXT" > counties/021.txt
echo "$TEXT" > counties/023.txt
echo "$TEXT" > counties/025.txt
echo "$TEXT" > counties/027.txt

echo "Splitting files..."
cat clean.txt | ag US-VT-001 >> counties/001.txt
echo "Split into files for county #1"
cat clean.txt | ag US-VT-003 >> counties/003.txt
echo "Split into files for county #3"
cat clean.txt | ag US-VT-005 >> counties/005.txt
echo "Split into files for county #5"
cat clean.txt | ag US-VT-007 >> counties/007.txt
echo "Split into files for county #7"
cat clean.txt | ag US-VT-009 >> counties/009.txt
echo "Split into files for county #9"
cat clean.txt | ag US-VT-011 >> counties/011.txt
echo "Split into files for county #11"
cat clean.txt | ag US-VT-013 >> counties/013.txt
echo "Split into files for county #13"
cat clean.txt | ag US-VT-015 >> counties/015.txt
echo "Split into files for county #15"
cat clean.txt | ag US-VT-017 >> counties/017.txt
echo "Split into files for county #17"
cat clean.txt | ag US-VT-019 >> counties/019.txt
echo "Split into files for county #19"
cat clean.txt | ag US-VT-021 >> counties/021.txt
echo "Split into files for county #21"
cat clean.txt | ag US-VT-023 >> counties/023.txt
echo "Split into files for county #23"
cat clean.txt | ag US-VT-025 >> counties/025.txt
echo "Split into files for county #25"
cat clean.txt | ag US-VT-027 >> counties/027.txt
echo "Split into files for county #27"

cd /Users/richard/src/birding/birdinginvermont.com/src/ebird-ext/shimeBirdData/
# TODO I'm not sure where this will print out files at the moment
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/001.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/003.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/005.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/007.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/009.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/011.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/013.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/015.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/017.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/019.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/021.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/023.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/025.txt'
node readEBirdDb.js '/Users/richard/Downloads/ebd_US-VT_relJan-2022/counties/027.txt'
# TODO This certainly won't print them in the right place
node joinTownJson.js

echo "Done!"


