#!/bin/bash

# Author: Chris Robertson <electronicsleep@gmail.com>
# Date: 12/30/2016
# Purpose: Simple bill calculation bash script
# Released under the BSD license

# Running:
# bash bills-calculate.sh

DATE=$(date +%Y-%m)

echo "##########################" > ./bills-calc/bills-total-bal-$DATE.txt
echo "BILLS DATE: $DATE" >> ./bills-calc/bills-total-bal-$DATE.txt
echo "##########################" >> ./bills-calc/bills-total-bal-$DATE.txt
echo "------------" >> ./bills-calc/bills-total-bal-$DATE.txt

cat ./bills.txt | grep "CUR_BAL " >> ./bills-calc/bills-total-bal-$DATE.txt

TOTAL=`cat ./bills.txt | grep 'CUR_BAL ' | cut -d ' ' -f 3 | awk '{ SUM += $1; print $1} END { print SUM }' | tail -n 1`

echo "------TOTAL------" >> ./bills-calc/bills-total-bal-$DATE.txt

echo "BALANCE: $TOTAL" >> ./bills-calc/bills-total-bal-$DATE.txt
echo "------------" >> ./bills-calc/bills-total-bal-$DATE.txt

cat ./bills-calc/bills-total-bal-*.txt

exit 0
