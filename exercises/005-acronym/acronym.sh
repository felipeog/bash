#!/usr/bin/env bash

# subsitute non-character and non-apostrophe with space
# then substitute multiple spaces with one space
clean_input=$(echo "$1" | sed -e "s/[^a-zA-Z\']/ /g" -e "s/ \{2,\}/ /g")

# get spaces count
space_count=$(echo "$clean_input" | grep -o " " | wc -l)

# `text` is initialized with `clean_input`, and it's mutated on the loop
text=$clean_input

# `result` is initialized with the first character
result=$(echo "$text" | cut -c 1)

# loop index
i=0

while [ $i -lt "$space_count" ]
do
  # get the first space occurrence position
  space_position=$(echo "$text" | grep -ob " " | head -1 | grep -Eo "[0-9]+")

  # get the character after the space position
  character_position=$(( space_position + 1 ))

  # `grep` uses zero-based indexing, `cut` uses one-based indexing
  # increment `grep` position by one
  cut_position=$(( character_position + 1 ))

  # get the character positioned after the space
  character=$(echo "$text" | cut -c "$cut_position")

  # concatenate `result` with `character`
  result="${result}${character}"

  # remove the first word and first space from `text`
  text=$(echo "$text" | cut -c "$cut_position"-)

  # update loop index
  i=$(( i + 1 ))
done

# transform `result` to uppercase
result=$(echo "$result" | tr '[:lower:]' '[:upper:]')

echo "$result"
