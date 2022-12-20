#!/bin/bash -i

head -n1 I8S/33RR20070204_00001_00001_ct1.stripped.csv > input/I8S_CTD-merged.csv
for item in I8S/*stripped.csv ; do tail -n+2 $item ; done >> input/I8S_CTD-merged.csv

head -n1 I9N/33RR20070322_00089_00003_ct1.stripped.csv > input/I9N_CTD-merged.csv
for item in I9N/*stripped.csv ; do tail -n+2 $item ; done >> input/I9N_CTD-merged.csv
