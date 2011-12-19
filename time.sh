#!/bin/bash

for i in {1..250}
do n=$(($i*2));
    echo $n | ./a.out >> time_column.csv
    echo End $n
done