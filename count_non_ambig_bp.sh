#!/bin/bash

## file input
file_in=${1?Error: no input file}

## create temporary directory
mkdir temp

## this counts the number of A's in each line that doesn't start with ">"
cat $file_in | grep -v "^>" | sed -E 's/[^ATGC]/''/g' | awk '{print length}' > temp/col1

## this counts the number of characters in each line that doesn't start with ">"
cat $file_in | grep -v "^>" | awk '{print length}' > temp/col2

## print together
paste temp/col1 temp/col2 | sed '1s/^/non_ambig_bp\ttotal_bp\n/'

## remove temp directory
rm -r temp