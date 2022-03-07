#! /bin/sh

cd /Volumes/Chaffinch/
python3 ~/src/vesper/vesper-audio-shim/rename_audiomoth_recordings.py
open .
#
# cp *.wav

#cd /Volumes/Erebus/msgr-vesper-archive/
cd /Users/richard/Sound/edinburgh-nocmig/Recordings
open .
conda activate vesper-d603294
open http://127.0.0.1:8000/
vesper_admin runserver