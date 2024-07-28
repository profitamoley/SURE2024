#!/bin/bash

# Request resources:
#SBATCH -c 24 # CPU core (64 max)
#SBATCH --mem=100G # memory required, up to 250G on standard nodes
#SBATCH -t 24:00:00 # time limit for job (format: days-hours:minutes:seconds) max 96hrs
#SBATCH --array=1-11%10 # Number of jobs within array
#SBATCH --mail-user=lpayne4@sheffield.ac.uk # Email address to sent status report
#SBATCH --mail-type=BEGIN,END,FAIL # Types of status update to email

####################################################################################################
#       Script Name:    Chloroplast_genome_array.sh
#       Description:    Generate chloroplast genomes from paired end illumina reads using getorganelle
#       Author:         Layla
#       Last updated:   14/06/2024
####################################################################################################

source /users/bob21lp/miniconda3/bin/activate
source activate /users/bob21lp/miniconda3/envs/getorganelle

# Array submission script
i=$(expr $SLURM_ARRAY_TASK_ID)
Sample_info=sample.txt # Text file containing the file name of each file within the array
sample=$(head -$i ${Sample_info} | tail -1  )
echo "this is job ${sample}"

#########

# Getorganelle script to retrieve chloroplast genomes
# add stuff to same line
# make new bash script
get_organelle_from_reads.py -s Eremochloa_reference_chloros.fasta -1 /mnt/parscratch/users/bob21lp/Eremochloa/Raw_data/${sample}R1.fastq.gz -2 /mnt/parscratch/users/bob21lp/Eremochloa/Raw_data/${sample}R2.fastq.
gz -t 24 -o ${sample}_chloroplast -F embplant_pt

# -w # reduce by 10
# --reduce-reads-for-coverage inf \
# --max-reads inf --max-n-words inf \
# --max-extending-len inf \
# -R rounds of assembly
# -k kmer spectra used
