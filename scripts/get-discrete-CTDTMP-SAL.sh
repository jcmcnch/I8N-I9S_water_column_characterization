#!/bin/bash -i
conda activate r-oce

mkdir -p CTD-plots

infile=input/I8S_metadata.tsv

for station in `tail -n+2 $infile | cut -f1 | cut -f1-2 -d- | sort | uniq`; do
       
	stationNo=`echo $station | cut -f2 -d- | sed 's/S//' | sed 's/^0//g'`
	paddedStationNo=`printf  "%05d" ${stationNo#0}`

	#add loop to account for multiple CTD casts per station
	for inputFile in `ls I8S/33RR20070204_$paddedStationNo*stripped.csv`; do
		
		grep $station $infile | cut -f9 >> foo.tsv
		sed -i 's/\n/.0\n/' foo.tsv
		filestem=`basename $inputFile .stripped.csv`
		dirname=`dirname $inputFile`
	
	done 

done

infile=input/I9N_metadata.tsv
  
for station in `tail -n+2 $infile | cut -f1 | cut -f1-2 -d- | sort | uniq`; do

        stationNo=`echo $station | cut -f2 -d- | sed 's/S//' | sed 's/^0//g'`
        paddedStationNo=`printf  "%05d" ${stationNo#0}`

        #add loop to account for multiple CTD casts per station
        for inputFile in `ls I9N/33RR20070322_$paddedStationNo*stripped.csv`; do

		grep $station $infile | cut -f9
                filestem=`basename $inputFile .stripped.csv`
                dirname=`dirname $inputFile`

        done

done
