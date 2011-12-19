#!/bin/bash

outputfile=time.csv
echo '"Number of Extent", RMO, CMO' >> $outputfile
for i in {1..250}
do n=$(($i*2));
    echo $n | ./a.out >> $outputfile
    echo End $n
done