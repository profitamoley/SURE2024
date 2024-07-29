## 2.1 

Hifiasm:
`hifiasm -o AUS1-HiFi.asm -t 64 WHPBRViwht20240523-2044.fastq.gz`

## 2.2

Extract contigs:
`awk '$1=="S"' asm.bp.p_ctg.gfa | sed 's/^S\t//; s/\t/\n/' > contigs.fasta`

