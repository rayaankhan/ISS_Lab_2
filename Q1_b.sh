#!/bin/bash
awk '!a[$0]++' $1 > "temp.txt"
cat temp.txt
rm "temp.txt"