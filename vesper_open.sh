#! /bin/sh

# Edit this if you want to import only a subfolder
cd /Volumes/Chaffinch/
# Edit these lines to change to the right place
python3 ~/src/vesper-audio-shim/rename_audiomoth_recordings.py "Edinburgh" /Users/richard/Sound/edinburgh-nocmig/Recordings
cd /Users/richard/Sound/edinburgh-nocmig/
# Edit this to the most recent commit
conda activate vesper-2470db0
open http://127.0.0.1:8000/
vesper_admin runserver