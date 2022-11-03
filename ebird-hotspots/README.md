# How to use this script

So, this script is a bit finicky.

## Getting the IDs for various hotspots

You need to manually get these, for now. Do this by putting the coordinates in `montpelier.js`, and then adding the function that gets the local hotspots, and then ...

... Got to be a better way to automatically get IDs from an area.

## Creating the data file for it to run

You need to make a list of only sightings from these hotspots, and then make a JSON file out of those.

1. Download the eBird data for Vermont (or Washington County, if you're only updating that).
2. Make a `clean.txt` version of it as part of your import process.
3. Copy 10kmontpelierhotspotids.txt and getids.sh into that folder.
4. Run `sh getids.sh`. This will make a 'montclean.txt' file.
5. Move that to the `data` folder in ebird-ext/.
6. Run `node shimeBirdData/readEBirdDb.js json data/montclean.txt`. This will make a `results.json` file. Note: This will exclude incidental checklists.
7. Rename this to `montpelierhotspots.json`. This will add it to the .gitignore. Move it to `data/`.
8. Rename `10kmontpelierhotspotids.txt` to JSON and move it to `data/`, too.
7. Delete `data/montclean.txt`. You can also delete `getids.sh` and `10k...` in the eBird_Ext folder, if you want, but that doesn't matter much.

## Running the program
8. Run `sh findMontpelierHotspotNeedsToday.sh`.

## Setting up continuous running