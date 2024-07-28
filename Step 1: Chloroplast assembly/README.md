##Step 1.a

Using GetOrganelle to assemble Eremochloa chloro DNA:

`chloro_array.sh`

If does not produce complete graph first time, adjust parameters:

  1. Reduce word size `-w` by 10 (minimum = 65) 
  2. Increase max reads `--max-reads` incrementally
  3. Adjust `-R` and `-k` (refer to https://github.com/Kinggerm/GetOrganelle)
