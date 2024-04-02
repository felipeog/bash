#!/usr/bin/env bash

number="$1"
digit_count="${#1}"
result=0
i=1

while [ "$i" -le "$digit_count" ]
do
  digit="$( echo "$number" | cut -c "$i" )"
  exponential="$( echo "$digit ^ $digit_count" | bc )"
  result=$(( result + exponential ))
  i=$(( i + 1 ))
done

if [ "$result" -eq "$number" ]
then
  echo "true"
else
  echo "false"
fi
