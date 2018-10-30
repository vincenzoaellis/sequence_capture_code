#!/bin/bash

#### Print length of each sequence in a fasta file to stdout.
#### Vincenzo A. Ellis
#### 30 October 2018

## file input
file_in=${1?Error: no input file}

## do work
cat $file_in | sed '1~2d' | awk '{print length}' | sed '1s/^/Seq_Length\n/'