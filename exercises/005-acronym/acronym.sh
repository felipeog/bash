#!/usr/bin/env bash

# -lt                          https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# (( ))                        https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
# [ ]                          https://www.gnu.org/software/bash/manual/bash.html#index-test
# [...]                        https://www.gnu.org/software/bash/manual/bash.html#Pattern-Matching
# [n] <<< word                 https://www.gnu.org/software/bash/manual/bash.html#Here-Strings
# +=                           https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters
# ${#name[subscript]}          https://www.gnu.org/software/bash/manual/bash.html#Arrays
# ${parameter:offset:length}   https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# ${parameter//pattern/string} https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# ${parameter^^pattern}        https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# $parameter                   https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# echo                         https://www.gnu.org/software/bash/manual/bash.html#index-echo
# id++                         https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
# IFS                          https://www.gnu.org/software/bash/manual/bash.html#index-IFS
# name=[value]                 https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters
# read                         https://www.gnu.org/software/bash/manual/bash.html#index-read
# while                        https://www.gnu.org/software/bash/manual/bash.html#index-while

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
