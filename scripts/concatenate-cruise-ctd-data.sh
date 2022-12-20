#!/bin/bash -i

infile=input/I8S_metadata.tsv
head -n1 I8S/33RR20070204_00001_00001_ct1.stripped.csv > input/I8S_CTD-merged.csv
echo "StationID" > finalcolumn.csv

for station in `tail -n+2 $infile | cut -f1 | cut -f1-2 -d- | sort | uniq`; do

        stationNo=`echo $station | cut -f2 -d- | sed 's/S//' | sed 's/^0//g'`
        paddedStationNo=`printf  "%05d" ${stationNo#0}`

        #add loop to account for multiple CTD casts per station
        for inputFile in `ls I8S/33RR20070204_$paddedStationNo*stripped.csv`; do

		tail -n+2 $inputFile >> input/I8S_CTD-merged.csv
		tail -n+2 $inputFile > tmp
		while read line ; do printf "$station\n" ; done < tmp >> finalcolumn.csv 
		rm -f tmp

        done

done

paste -d, input/I8S_CTD-merged.csv finalcolumn.csv | sponge input/I8S_CTD-merged.csv

rm -f finalcolumn.csv

infile=input/I9N_metadata.tsv
head -n1 I9N/33RR20070322_00089_00003_ct1.stripped.csv > input/I9N_CTD-merged.csv
echo "StationID" > finalcolumn.csv

for station in `tail -n+2 $infile | cut -f1 | cut -f1-2 -d- | sort | uniq`; do

        stationNo=`echo $station | cut -f2 -d- | sed 's/S//' | sed 's/^0//g'`
        paddedStationNo=`printf  "%05d" ${stationNo#0}`

        #add loop to account for multiple CTD casts per station
        for inputFile in `ls I9N/33RR20070322_$paddedStationNo*stripped.csv`; do

                tail -n+2 $inputFile >> input/I9N_CTD-merged.csv
		tail -n+2 $inputFile > tmp
                while read line ; do printf "$station\n" ; done < tmp >> finalcolumn.csv
		rm -f tmp

        done

done

paste -d, input/I9N_CTD-merged.csv finalcolumn.csv | sponge input/I9N_CTD-merged.csv

rm -f finalcolumn.csv

#head -n1 I8S/33RR20070204_00001_00001_ct1.stripped.csv > input/I8S_CTD-merged.csv
#for item in I8S/*stripped.csv ; do tail -n+2 $item ; done >> input/I8S_CTD-merged.csv

#head -n1 I9N/33RR20070322_00089_00003_ct1.stripped.csv > input/I9N_CTD-merged.csv
#for item in I9N/*stripped.csv ; do tail -n+2 $item ; done >> input/I9N_CTD-merged.csv
