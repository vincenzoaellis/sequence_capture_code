#!/bin/bash

#### Convert ambiguity codes in fasta file (M, R, W, S, Y, K, V, H, D, B, N) to determinate
#### nucleotides (A, T, C, G) using awk. The code comes from "karakfa" and can
#### be found on stackoverflow: 
#### https://stackoverflow.com/questions/53047045/evaluate-expression-in-sed-with-each-replacement
#### Then rename the sequences sequentially (seq1, seq2, ...) in fasta format.
#### Vincenzo A. Ellis
#### 30 October 2018

## input file
file_in=${1?Error: no input file}

## do work
cat $file_in |
  sed '1~2d' | awk -v r='A C' 'BEGIN{n=split(r,c); srand()}
                                    {do x=c[int(rand()*n)+1];
                                     while (sub("M",x))}1' |
               awk -v r='A G' 'BEGIN{n=split(r,c); srand()}
                                    {do x=c[int(rand()*n)+1];
                                     while (sub("R",x))}1' |
               awk -v r='A T' 'BEGIN{n=split(r,c); srand()}
                                    {do x=c[int(rand()*n)+1];
                                     while (sub("W",x))}1' |
               awk -v r='C G' 'BEGIN{n=split(r,c); srand()}
                                    {do x=c[int(rand()*n)+1];
                                     while (sub("S",x))}1' |
               awk -v r='C T' 'BEGIN{n=split(r,c); srand()}
                                    {do x=c[int(rand()*n)+1];
                                     while (sub("Y",x))}1' |
               awk -v r='G T' 'BEGIN{n=split(r,c); srand()}
                                    {do x=c[int(rand()*n)+1];
                                     while (sub("K",x))}1' |
               awk -v r='A C G' 'BEGIN{n=split(r,c); srand()}
                                      {do x=c[int(rand()*n)+1];
                                       while (sub("V",x))}1' |
               awk -v r='A C T' 'BEGIN{n=split(r,c); srand()}
                                      {do x=c[int(rand()*n)+1];
                                       while (sub("H",x))}1' |
               awk -v r='A G T' 'BEGIN{n=split(r,c); srand()}
                                      {do x=c[int(rand()*n)+1];
                                       while (sub("D",x))}1' |
               awk -v r='C G T' 'BEGIN{n=split(r,c); srand()}
                                      {do x=c[int(rand()*n)+1];
                                       while (sub("B",x))}1' |
               awk -v r='A C G T' 'BEGIN{n=split(r,c); srand()}
                                        {do x=c[int(rand()*n)+1];
                                         while (sub("N",x))}1' |
               awk '$0=">seq"NR"\n"$0'