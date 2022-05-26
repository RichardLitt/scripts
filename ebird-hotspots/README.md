# How to use this script

So, this script is a bit finicky.

## Creating the data file for it to run

You need to make a list of only sightings from these hotspots, and then make a JSON file out of those.

1. Download the eBird data for Vermont (or Washington County, if you're only updating that).
2. Make a `clean.txt` version of it as part of your import process.
3. Copy 10kmontpelierhotspotids.txt and getids.sh into that folder.
4. Run `sh getids.sh`. This will make a 'montclean.txt' file.
5. Move that to the `data` folder in ebird-ext/.
6. Run `node shimeBirdData/readEBirdDb.js towns data/montclean.txt`. This will make a `results.json` file.
7. Rename this to `montpelierhotspots.json`. This will add it to the .gitignore.
7. Delete `data/montclean.txt`. You can also delete `getids.sh` and `10k...` in the eBird_Ext folder, if you want, but that doesn't matter much.

## Running the program
8. Run `sh findMontpelierHotspotNeedsToday.sh`.

## Setting up continuous running