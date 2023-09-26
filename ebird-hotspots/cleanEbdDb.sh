#!/usr/bin/env bash

sed 's/"//g' ebd_*.txt > clean.txt
sed "s/'//g" clean.txt > nodouble.txt
mv nodouble.txt clean.txt