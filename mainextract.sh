#!/bin/bash

rm sampleAd.txt samplePr.txt Pres upt err N2_ZIF8Finaldata.csv

grep -F 'Average loading absolute [cm^3 (STP)/gr framework]' *.data > sampleAd.txt
grep -F 'Partial pressure' *.data> samplePr.txt


#Awking the pipe to get values
awk -F' ' '{print $4}' samplePr.txt > Pres
awk -F' ' '{print $8}' sampleAd.txt > upt
awk -F' ' '{print $10}' sampleAd.txt > err


#Pasting to a new csv file
echo -e "Pressure,Uptake,Error" > N2_ZIF8Finaldata.csv
paste Pres upt err -d"," >>N2_ZIF8Finaldata.csv

sort -n N2_ZIF8Finaldata.csv > CompleteData.csv
