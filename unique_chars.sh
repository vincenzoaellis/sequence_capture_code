#!/bin/bash

#### Identify the unique single characters in the sequence part of a fasta file
#### and print to stdout.
#### Vincenzo A. Ellis
#### 29 October 2018

## input file
file_in=${1?Error: no input file}

## do work
cat $file_in | sed '1~2d' | grep -o . | sort -u