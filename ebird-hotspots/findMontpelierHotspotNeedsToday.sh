#!/bin/bash

## Montpelier
/Users/richard/.nvm/versions/node/v14.15.5/bin/node /Users/richard/src/birding/birdinginvermont.com/src/ebird-ext/montpelier.js > /Users/richard/src/scripts/logs/hotspots.log
/Library/Frameworks/Python.framework/Versions/3.7/bin/python3 /Users/richard/src/scripts/emailNeeds.py

## Williamstown
/Users/richard/.nvm/versions/node/v14.15.5/bin/node /Users/richard/src/birding/birdinginvermont.com/src/ebird-ext/montpelier.js '44.1341227,-72.5339384' > /Users/richard/src/scripts/logs/williamstownHotspots.log
/Library/Frameworks/Python.framework/Versions/3.7/bin/python3 /Users/richard/src/scripts/emailWilliamstownNeeds.py