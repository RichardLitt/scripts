#! /bin/sh

cd /Volumes/Chaffinch/
python3 ~/src/vesper-audio-shim/rename_audiomoth_recordings.py
cd /Users/richard/Sound/nocmig-blebo-craig/
conda activate vesper-d603294
open http://127.0.0.1:8000/
vesper_admin runserver