Hifi assembly with Hifiasm:
Hifiasm GitHub:

Run Hifiasm:
`hifiasm -o AUS1-HiFi.asm -t 64 WHPBRViwht20240523-2044.fastq.gz`

Then extract contigs and check quality of assembly with BUSCO and QUAST:

1. `awk '$1=="S"' asm.bp.p_ctg.gfa | sed 's/^S\t//; s/\t/\n/' > species_contigs.fasta`
2. `busco.sh`
3. `quast.sh`

BLAST results to see if Erenochloa present:

