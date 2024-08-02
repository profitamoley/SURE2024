## BUSCO ##
# This program check the assembly completeness by assessing how many core embryophyta genes are present in your assembly
 # User Guide --> https://busco.ezlab.org/busco_userguide.html

 # Conda --> https://bioconda.github.io/recipes/busco/README.html
 # Activate BUSCO venv
 conda activate busco-env

 # Conda --> https://bioconda.github.io/recipes/augustus/README.html (You also need to install this in a seperate environment)
 # Activate augustus venv
 conda activate augustus

# Code 

source /users/bob21lp/miniconda3/bin/activate
source activate /users/bob21lp/miniconda3/envs/busco-env

export PATH=/users/bob21lp/miniconda3/envs/augustus:$PATH
export AUGUSTUS_CONFIG_PATH="/users/bob21lp/miniconda3/envs/augustus/config"


busco -m geno -i /mnt/parscratch/users/bob21lp/public/Alloteropsis/species_contigs.fasta -c 24 \
-l /mnt/parscratch/users/bob21lp/public/Alloteropsis/BUSCO/BUSCO_datasets/embryophyta_odb10 \
#--download_path /mnt/parscratch/users/bop22ngb/Aegilops/BUSCO/busco_downloads/ \
-o assembly_embryophyta_odb10

# Notes:
#   - This script activates the BUSCO environment then uses augustus config
#   - Download and extract the embryophyta dataset https://busco-data.ezlab.org/v5/data/lineages/embryophyta_odb10.2024-01-08.tar.gz
#   - Try running without Download path first then if does not work find busco downloads file and use it in next run
