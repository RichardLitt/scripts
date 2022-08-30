#! /bin/sh

RECORDINGS="/Users/richard/Sound/nfc-22-04-16-oich/Recordings"

# Note: You need to copy the archive template and instantiate Conda, and I'm not sure this works all of the time

# Edit this if you want to import only a subfolder
cd /Volumes/Crossbill/April\ 16\ Bridge\ of\ Oich/
# Edit these lines to change to the right place
python3 ~/src/vesper-audio-shim/rename_audiomoth_recordings.py "Bridge of Oich" $RECORDINGS
cd $RECORDINGS
# Edit this to the most recent commit
conda activate vesper-0.4.13
open http://127.0.0.1:8000/
vesper_admin runserver