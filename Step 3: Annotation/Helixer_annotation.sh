#!/bin/bash

# Request resources:

#SBATCH --partition=gpu
#SBATCH --qos=gpu
#SBATCH --gres=gpu:2
#SBATCH --mem=82G
#SBATCH -t 96:00:00 # time limit for job (format: days-hours:minutes:seconds) max 96hrs
#SBATCH --mail-user=lpayne4@sheffield.ac.uk # Email address to sent status report
#SBATCH --mail-type=BEGIN,END,FAIL # Types of status update to email

####################################################################################################
#       Script Name:    Helixer.sh
#       Description:    Get helixer annotations using gpu
#       Author:         Layla Payne
#       Last updated:   9/07/2024
####################################################################################################

export HELIXER_SIF=/mnt/parscratch/users/bob21lp/public/Helixer/helixer-docker_helixer_v0.3.3_cuda_11.8.0-cudnn8.sif

apptainer exec ${HELIXER_SIF} Helixer.py --fasta-path /mnt/parscratch/users/bob21lp/public/SURE/Alloteropsis/AUS1/HiFi/species_contigs.fasta \
--lineage land_plant --batch-size 512 --gff-output-path output.gff3
