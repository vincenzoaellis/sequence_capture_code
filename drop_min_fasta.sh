#!/bin/bash

#### Drop sequences from a fasta file that have length less than some minimum value,
#### then rename the sequences uniquely and sequentially in the order they appear. Output
#### to stdout.
#### Vincenzo A. Ellis
#### 17 October 2018

# file input
file_in=${1?Error: no input file}

# minimum sequence length (defaults to 120 bp)
seq_len=${2:-120}

# do the work
cat $file_in | sed '1~2d' | awk -vseq_len="$seq_len" 'length($0) > seq_len' | awk '$0=">seq"NR"\n"$0'
