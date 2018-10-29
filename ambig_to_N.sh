#!/bin/bash

#### Convert ambiguity codes (i.e., all not ATCG) in fasta file to N. Output
#### to stdout. Comes from https://github.com/lh3/seqtk/issues/63
#### Vincenzo A. Ellis
#### 26 October 2018

# file input
file_in=${1?Error: no input file}

# do the work
cat $file_in | sed '/^[^>]/ s/[^AGTC]/N/g'
