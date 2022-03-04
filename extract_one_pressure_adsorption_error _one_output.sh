#!/bin/bash

grep 'Average loading absolute' output_Cu-BTC_1.1.1_77.000000_1.data  > sample.txt
grep 'External Pressure' output_Cu-BTC_1.1.1_77.000000_1.data >> sample.txt

PRESSURE=$(awk 'FNR==7 { print $3 }' sample.txt)
UPTAKE=$(awk -F ' ' 'FNR==3 { print $6 }' sample.txt)
ERROR=$(awk -F ' ' 'FNR==3 { print $8 }' sample.txt)

echo -e "Pressure\tUptake\tError" > maybe.csv
echo -e "${PRESSURE}\t${UPTAKE}\t${ERROR}" >> maybe.csv
