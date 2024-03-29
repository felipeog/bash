#!/usr/bin/env bash

# -ne  https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# [ ]  https://www.gnu.org/software/bash/manual/bash.html#index-test
# $#   https://www.gnu.org/software/bash/manual/bash.html#index-_0023
# $N   https://www.gnu.org/software/bash/manual/bash.html#Positional-Parameters
# echo https://www.gnu.org/software/bash/manual/bash.html#index-echo
# exit https://www.gnu.org/software/bash/manual/bash.html#index-exit
# if   https://www.gnu.org/software/bash/manual/bash.html#index-if

if [ $# -ne 1 ]
then
  echo "Usage: error_handling.sh <person>"
  exit 1
else
  echo "Hello, $1"
fi
