#!/usr/bin/env bash

# -lt                        https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# -ne                        https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# !=                         https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# (( ))                      https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
# [ ]                        https://www.gnu.org/software/bash/manual/bash.html#index-test
# &&                         https://www.gnu.org/software/bash/manual/bash.html#Lists
# ${#parameter}              https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# ${parameter:offset:length} https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# $#                         https://www.gnu.org/software/bash/manual/bash.html#index-_0023
# $parameter                 https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# echo                       https://www.gnu.org/software/bash/manual/bash.html#index-echo
# exit                       https://www.gnu.org/software/bash/manual/bash.html#index-exit
# id++                       https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
# if                         https://www.gnu.org/software/bash/manual/bash.html#index-if
# name=[value]               https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters
# while                      https://www.gnu.org/software/bash/manual/bash.html#index-while

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
  (( i++ ))
done

echo $count
