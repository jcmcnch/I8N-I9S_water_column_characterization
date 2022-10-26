#!/bin/bash -i

#NOTE: CTD data sourced from https://cchdo.ucsd.edu/

#extract csvs from zip files
#mkdir I8S ; unzip input/I08S_33RR20070204_ct1.zip ; mv *csv I8S
#mkdir I9N ; unzip input/I09N_33RR20070322_ct1.zip ; mv *csv I9N
 
#strip off header lines that aren't needed
for item in I8S/* ; do 
	
	outfile=I8S/`basename $item .csv`.stripped.csv
	tail -n+51 $item | grep -v "END" | grep -v "DBAR" > $outfile

done

#slice off header lines that aren't needed
for item in I9N/* ; do 

	outfile=I9N/`basename $item .csv`.stripped.csv	
	tail -n+56 $item | grep -v "END" | grep -v "DBAR" > $outfile

done
