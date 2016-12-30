#!/bin/bash

# Author: Chris Robertson <electronicsleep@gmail.com>
# Date: 12/30/2016
# Purpose: Simple bill calculation bash script
# Released under the BSD license

# Running:
# bash bills-calculate.sh

DATE=$(date +%Y-%m)

FILE=./bills-calc/bills-total-bal-$DATE.txt

echo "##########################" > $FILE
echo "BILLS DATE: $DATE" >> $FILE
echo "##########################" >> $FILE
echo "------------" >> $FILE

cat ./bills.txt | grep "CUR_BAL " >> $FILE

TOTAL=`cat ./bills.txt | grep 'CUR_BAL ' | cut -d ' ' -f 3 | awk '{ SUM += $1; print $1} END { print SUM }' | tail -n 1`

echo "------TOTAL------" >> $FILE

echo "BALANCE: $TOTAL" >> $FILE
echo "------------" >> $FILE

cat ./bills-calc/bills-total-bal-*.txt

exit 0
