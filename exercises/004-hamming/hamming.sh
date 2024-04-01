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
i=1

while [ $i -le "$length" ]
do
  from=$(echo "$1" | cut -c $i)
  to=$(echo "$2" | cut -c $i)

  [ "$from" != "$to" ] && count=$(( count + 1 ))

  i=$(( i + 1 ))
done

echo $count
