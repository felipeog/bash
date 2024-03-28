#!/usr/bin/env bash

if [ $# -ne 2 ]
then
  echo "Usage: hamming.sh <string1> <string2>"
  exit 1
fi

if [ ${#1} -ne ${#2} ]
then
  echo "strands must be of equal length"
  exit 1
fi

length=${#1}
count=0
i=0

while [ $i -lt "$length" ]
do
  [ "${1:$i:1}" != "${2:$i:1}" ] && (( count++ ))
  i=$(( i + 1 ))
done

echo $count
