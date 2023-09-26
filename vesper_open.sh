#! /bin/sh

RECORDINGS="/Volumes/ABAIA/Blanchard Park 2023/Recordings"

# Note: You need to copy the archive template and instantiate Conda, and I'm not sure this works all of the time

# Edit this if you want to import only a subfolder
cd /Volumes/ABAIA/Blanchard\ Park\ 2023/
# Edit these lines to change to the right place
# python3 ~/src/vesper-audio-shim/rename_audiomoth_recordings.py "Bridge of Oich" $RECORDINGS
# cd $RECORDINGS
# Edit this to the most recent commit
conda activate vesper-0.4.13
# Note: TODO I am unsure how to automatically activate this too
echo "Remember to open a new table and open conda activate birdvoxdetect-0.6.0"
# conda activate birdvoxdetect-0.6.0
open http://127.0.0.1:8000/
vesper_admin runserver