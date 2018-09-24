#!/bin/bash

#### Run bowtie2 on SGS1 probe sequences and get genome coordinates of targeted exons and genes
#### Vincenzo A. Ellis
#### 22 April 2018

## load modules (specific to Uppmax)
module load bioinfo-tools
module load bowtie2/2.3.3.1
module load samtools/1.6
module load BEDTools/2.27.1

## map with bowtie2
bowtie2 -x /proj/snic2017-7-320/analysis/sgs1_ref/sgs1db/sgs1db \
    -U /proj/snic2017-7-320/analysis/sgs1_probes/sgs1_probes.fasta \
    --score-min 'C,0,-1' \
    -f -S /proj/snic2017-7-320/analysis/bowtie2_maps/test_case/probes.sam
    
## convert to bam
samtools view -bS /proj/snic2017-7-320/analysis/bowtie2_maps/test_case/probes.sam > /proj/snic2017-7-320/analysis/bowtie2_maps/test_case/probes.bam

## check intersect between the SGS1 genome gff file and the mapped probes
## this will give information on exons and genes that the probes cover
bedtools intersect -a /proj/snic2017-7-320/analysis/sgs1_ref/PlasmoDB-36_PrelictumSGS1-like.gff \
    -b /proj/snic2017-7-320/analysis/bowtie2_maps/test_case/probes.bam \
    -wa > /proj/snic2017-7-320/analysis/bowtie2_maps/test_case/probes_intersect.bed
