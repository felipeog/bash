#!/usr/bin/env bash

# -eq                https://www.gnu.org/software/bash/manual/bash.html#Bash-Conditional-Expressions
# [ ]                https://www.gnu.org/software/bash/manual/bash.html#index-test
# &&                 https://www.gnu.org/software/bash/manual/bash.html#Lists
# %                  https://www.gnu.org/software/bash/manual/bash.html#Shell-Arithmetic
# name=[value]       https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters
# +=                 https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameters
# $(( ))             https://www.gnu.org/software/bash/manual/bash.html#Arithmetic-Expansion
# ${parameter:-word} https://www.gnu.org/software/bash/manual/bash.html#Shell-Parameter-Expansion
# $N                 https://www.gnu.org/software/bash/manual/bash.html#Positional-Parameters
# echo               https://www.gnu.org/software/bash/manual/bash.html#index-echo

[ $(( $1 % 3 )) -eq 0 ] && result+="Pling"
[ $(( $1 % 5 )) -eq 0 ] && result+="Plang"
[ $(( $1 % 7 )) -eq 0 ] && result+="Plong"

echo "${result:-$1}"
