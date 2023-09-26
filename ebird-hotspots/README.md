# How to use this script

So, this script is a bit finicky.

## Getting the IDs for various hotspots

You need to manually get these, for now. Do this by putting the coordinates in `montpelier.js`. Then take the printout, and replace them in 10kmontpelierhotspotids.txt.

```
$ node montpelier.js ids
```


## Creating the data file for it to run

You need to make a list of only sightings from these hotspots, and then make a JSON file out of those.

1. Download the eBird data for Vermont (or Washington County, if you're only updating that).
2. Run cleanEbdDb.sh to make a clean file.
3. Get your IDs by running `node montpelier.js ids` in ebird-ext.

Another option here is to use `node montpelier.js regions US-VT-025`, instead. That will produce all of the IDs for Washington County. 

3. Copy your IDs text file and getids.sh into the eBird downloads folder.
4. Run `sh getids.sh IDfile.txt`. This will make a 'IDfile-clean.txt' file. `useAwk.sh` is a better file, I think, but I haven't tested it completely.
5. Move that to the `data` folder in ebird-ext/.
6. Run `node shimeBirdData/readEBirdDb.js json data/IDfile-clean.txt`. This will make a `results.json` file. Note: This will exclude incidental checklists, but you need to check that it is doing that by checking 'complete' in the function opts.
7. Rename this to `montpelierhotspots.json`. Move it to `data/`.
8. Then, run `node montpelier.js shimFilterHotspotJSON`. You need to manually enable the import on like line 3 to match the updated file in data. 
8. Rename `10kmontpelierhotspotids.txt` to JSON and move it to `data/`, too. (But why?)
7. Delete `data/montclean.txt`. You can also delete `getids.sh` and `10k...` in the eBird_Ext folder, if you want, but that doesn't matter much.


## Running the program
8. Run `sh findMontpelierHotspotNeedsToday.sh`.

## Setting up continuous running


# Location IDs for automatically getting data

Allen Brothers Marsh - L201202
Hubbard Park - L165280
NBNC - L166319
Berlin Pond - L150998
