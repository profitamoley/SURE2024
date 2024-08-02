#!/bin/bash

# Request resources:
#SBATCH -c 24 # CPU core (64 max)
#SBATCH --mem=100G # memory required, up to 250G on standard nodes
#SBATCH -t 24:00:00 # time limit for job (format: days-hours:minutes:seconds) max 96hrs
#SBATCH --mail-user=lpayne4@sheffield.ac.uk # Email address to sent status report
#SBATCH --mail-type=BEGIN,END,FAIL # Types of status update to email

source /users/bob21lp/miniconda3/bin/activate
source activate gffread

gffread -w genes.fasta -g /mnt/parscratch/users/bob21lp/public/SURE/Alloteropsis/AUS1/HiFi/species_contigs.fasta output.gff3

gffread -y proteins.faa -g /mnt/parscratch/users/bob21lp/public/SURE/Alloteropsis/AUS1/HiFi/species_contigs.fasta output.gff3
