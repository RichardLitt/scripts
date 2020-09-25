#! /bin/sh

cd /Volumes/Erebus/msgr-vesper-archive/
conda activate vesper-0.4.8
open http://127.0.0.1:8000/
vesper_admin runserver