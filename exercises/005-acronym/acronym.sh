#!/usr/bin/env bash

IFS=" "
read -r -a words <<< "${1//[^a-zA-Z\']/ }"

i=0
length=${#words[@]}
result=""

while [ $i -lt "$length" ]
do
  result+=${words[$i]:0:1}
  (( i++ ))
done

echo "${result^^}"
