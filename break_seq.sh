#!/bin/bash

#### Break fasta sequences into sequences of length <= 5000bp so that mappers like
#### Stampy can map the fasta reads to a reference (it can't do bigger than 4500bp). 
#### Rename the sequences sequentially and output to stdout.
#### Vincenzo A. Ellis
#### 30 October 2018

# file input
file_in=${1?Error: no input file}

# maximum sequence length (where to break the sequence, defaults to 5000 bp)
seq_len=${2:-5000}

# do the work
cat $file_in | sed '1~2d' | fold -w$seq_len | awk '$0=">seq"NR"\n"$0'