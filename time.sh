#!/bin/bash

case "$0" in
/*) A=`dirname "$0"` ;;
*) A=`dirname "$PWD/$0"` ;;
esac
echo $A

#change to your own fortran compiler
gfortran -o $A/a.out $A/script/time.f90

outputfile=$A/result/time-`date +%Y%m%d%H%M%S`.csv
startTime=`date +%s`
echo '"Number of Extent", RMO, CMO' >> $outputfile
for i in {1..50}
do n=$(($i*2));
    echo $n | $A/a.out >> $outputfile
    echo End $n
done
endTime=`date +%s`

rm $A/a.out

echo duration , $startTime, $endTime >> $outputfile