#!/bin/bash
#SBATCH -c 24 # CPU core (64 max)
#SBATCH --mem=200G # memory required, up to 250G on standard nodes
#SBATCH -t 48:00:00 # time limit for job (format: days-hours:minutes:seconds) max 96hrs
#SBATCH --array=1-12%6 # Number of jobs within array
#SBATCH --mail-user=lpayne4@sheffield.ac.uk # Email address to sent status report
#SBATCH --mail-type=BEGIN,END,FAIL # Types of status update to email

#activate bowtie2 and samtools env
source /users/bob21lp/miniconda3/bin/activate
source activate /users/bob21lp/miniconda3/envs/array

#define paths
reference1=/mnt/parscratch/users/bob21lp/public/SURE/Alloteropsis/AUS1/HiFi/species_contigs.fasta
out_reference1=/mnt/parscratch/users/bob21lp/public/SURE/Alloteropsis/AUS1/Bowtie2_alignment
data=/mnt/parscratch/users/bob21lp/public/SURE/Eremochloa/Raw_data

#retrieve sample file name
i=$(expr $SLURM_ARRAY_TASK_ID)
Sample_info=/mnt/parscratch/users/bob21lp/public/SURE/Eremochloa/Scripts/sample.txt # Text file containing the file name of each file within the array
sample=$(head -$i ${Sample_info} | tail -1  )

echo "this is job ${sample}"

#perform alignment using bowtie2
bowtie2 -x ${reference1} -1 ${data}/${sample}_R1.fastq.gz -2 ${data}/${sample}_R2.fastq.gz --no-unal -p 2 -S ${sample}.sam

#convert .sam to .bam files
samtools view -bS ${sample}.bam
