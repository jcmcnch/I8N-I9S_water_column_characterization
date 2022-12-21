#!/bin/bash -i

for station in `tail -n+2 input/I9N_metadata.tsv | cut -f1 | cut -f1-2 -d- | sort | uniq`; do

	outfile=input/I9N.$station.tsv
	head -n1 input/I9N_metadata.tsv > $outfile
        grep $station input/I9N_metadata.tsv | sort -n -k7 >> $outfile

done

for station in `tail -n+2 input/I8S_metadata.tsv | cut -f1 | cut -f1-2 -d- | sort | uniq`; do

        outfile=input/I8S.$station.tsv
        head -n1 input/I8S_metadata.tsv > $outfile
        grep $station input/I8S_metadata.tsv | sort -n -k7 >> $outfile

done
