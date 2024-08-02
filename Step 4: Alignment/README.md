Bowtie2 alignment:
1. Build Bowtie database: `bowtie2-build species_contigs.fasta species_contigs.fasta`
2. Run array to align 12 Eremochloa to Alloteropsis reference e.g. `AUS1_array.sh`
3. Convert output .sam files to .bam files: `samtools view -bS - > `
