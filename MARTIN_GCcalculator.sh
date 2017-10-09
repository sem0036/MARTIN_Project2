#!/bin/bash

#sanity check 1: Specify input on command line
if [ $# != 1  ]; then
	echo "Error: include fasta filename"
	exit
	else echo "Fasta filename submitted"
fi

#sanity check 2: does file exist?
if [ ! -s "$1" ]; then
	echo "Error file does not exist"
	exist
	else echo "File exists as input"
fi  

#create file with columns for Sequence name and GC percentages
echo "Sequence name		GC Percentage" > GCcount.txt

#Calculate number of sequences in input fasta file
seq=$(grep -c ">" $1)

#create arrays for sequence names as well as sequences
sequencename=($(grep ">" $1 | cat))
#echo ${sequencename(@)}
sequence=($(grep -v '>' $1 | cat))
#echo ${sequence(@)} 

#for loop calculating GC and total
for ((i=0; i<$seq; i++))
	do  
		G="$(echo ${sequence[$i]} | grep -o 'G' | wc -l)"
		C="$(echo ${sequence[$i]} | grep -o 'C' | wc -l)"
		GC=$(echo $G+$C | bc -l)
		total=$(echo ${sequence[$i]} | wc -m)
		percent=$(echo "scale=2 ; ($GC/$total)" | bc)
		echo "${sequencename[$i]}		$percent" >> GCcount.txt
	done

echo "Exiting"
