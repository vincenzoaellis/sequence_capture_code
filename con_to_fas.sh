#!/bin/bash

#### Convert consensus sequence (fast format, created in Geneious) from a bam file (mapped sequence reads)
#### into a fasta file in which each individual sequence of nucleotides gets its own name
#### (i.e., "seq1", "seq2", etc.). The consensus sequence has "?"s in between mapped nucleotide sequences
#### ("A", "T", "G", "C", ambiguities), so the program needs to break up the consensus on the "?" characters
#### and then save to std.out
#### Vincenzo A. Ellis
#### 17 October 2018

# file input
file_in=${1?Error: no input file}

cat $file_in | sed '1d' | tr -s '?' | awk 'BEGIN{RS="?"}NR>1{$1 =">seq"NR-1"\n"$1; print }'
