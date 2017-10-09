# Project 2
### Sarah Martin

## Run in bash
```sh
#!/bin/bash
```

## Input file
ADH.fa

## Output file 
GCcount.txt

## This code performs as a GC calculator when run with a fasta file

### Total number of sequences
```sh
seq=$(grep -c ">" $1)
```

### Arrays for name of sequence and actual sequence
```sh
sequencename=($(grep ">" $1 | cat))
sequence=($(grep -v '>' $1 | cat))
```

### For loop to calculate GC percentage and insert it into GCcount.txt
```sh
for ((i=0; i<$seq; i++))
        do
                G="$(echo ${sequence[$i]} | grep -o 'G' | wc -l)"
                C="$(echo ${sequence[$i]} | grep -o 'C' | wc -l)"
                GC=$(echo $G+$C | bc -l)
                total=$(echo ${sequence[$i]} | wc -m)
                percent=$(echo "scale=2 ; ($GC/$total)" | bc)
                echo "${sequencename[$i]}               $percent" >> GCcount.txt
        done
```
### Table of percentages for input file

|Sequence Name|GC Percentage|
|:----:|:-----|
|>DI245396.1|43|
|>DI245395.1|42|
|>HW262829.1|43|
|>546218138|42|
|>X13802.1|39|
|>NM_001179558.3|51|
|>NM_001178613.2|45|
|>AY558240.1|51|
|>AB052924.1|51|
