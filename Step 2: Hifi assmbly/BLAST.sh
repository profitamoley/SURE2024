#!/bin/bash

# SLURM resource request parameters
#SBATCH --job-name=BLAST_AUS1               # Job name
#SBATCH --nodes=1                           # Number of nodes
#SBATCH --ntasks=1                          # Number of tasks
#SBATCH --cpus-per-task=24                  # Number of CPU cores per task
#SBATCH --mem=100G                          # Memory required
#SBATCH --time=48:00:00                     # Time limit (format: days-hours:minutes:seconds)
#SBATCH --mail-user=lpayne4@sheffield.ac.uk # Email address for notifications
#SBATCH --mail-type=ALL                     # Email notifications: BEGIN, END, FAIL, ALL

source /users/bob21lp/miniconda3/bin/activate blast

blastn -db /mnt/parscratch/users/bob21lp/public/SURE/Plastid_references/cp_database_final.fa \
-query /mnt/parscratch/users/bob21lp/public/SURE/Alloteropsis/AUS1/HiFi/output_sliding.fasta \
-outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qseq" \
-max_target_seqs 1 -out blast.txt
