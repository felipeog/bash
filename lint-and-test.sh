#!/usr/bin/env bash

echo "start: shellcheck"
shellcheck ./exercises/${1}*/*.sh
echo "exit code: $?"
echo "end: shellcheck"
echo

echo "start: checkbashisms"
checkbashisms ./exercises/${1}*/*.sh
echo "exit code: $?"
echo "end: checkbashisms"
echo

echo "start: bats"
bats ./exercises/${1}*/*.bats
echo "exit code: $?"
echo "end: bat"
echo
