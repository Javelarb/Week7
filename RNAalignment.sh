#!/bin/bash
#SBATCH --job-name=JA_RNA_alignment ## Name of the job. 
#SBATCH -A ecoevo283 ##account to charge 
#SBATCH -p standard ## partition/queue name 
#SBATCH --array=1-21 ### number of tasks to launch, given hint below wc -l $file is helpful
#SBATCH --cpus-per-task=4 ## number of cores the job needs, can the programs you run make used of multiple cores?

module load hisat2/2.2.1
module load samtools/1.10 
module load bcftools/1.10.2

#what I used to generate RNA seq prefixes
#for i in RNASeq/{100..120}_*R1*.fastq.gz; do basename ${i} | sed 's/_R1_001.fastq.gz//'; done >> RNA_prefixes.txt

file="RNA_prefixes.txt"
ref="ref/dmel-all-chromosome-r6.13.fasta"
prefix=`head -n $SLURM_ARRAY_TASK_ID $file | tail -n 1` 
dir="RNASeq_out"

hisat2 -p 4 -x $ref -1 RNASeq/${prefix}_R1_001.fastq.gz -2 RNASeq/${prefix}_R2_001.fastq.gz -S $dir/$prefix.sam 
samtools view -bS $dir/$prefix.sam > $dir/$prefix.bam 
samtools sort $dir/$prefix.bam -o $dir/$prefix.sorted.bam
samtools index $dir/$prefix.sorted.bam
