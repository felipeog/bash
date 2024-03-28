#!/usr/bin/env bats

load "../../test/common-setup.sh"
load "../../test/get-test-folder.sh"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
BASH_FILE=$TEST_FOLDER/hamming.sh

setup() {
  common_setup
}

@test 'empty strands' {
  run bash $BASH_FILE '' ''

  assert_success
  assert_output "0"
}

@test 'single letter identical strands' {
  run bash $BASH_FILE 'A' 'A'

  assert_success
  assert_output "0"
}

@test 'single letter different strands' {
  run bash $BASH_FILE 'G' 'T'

  assert_success
  assert_output "1"
}

@test 'long identical strands' {
  run bash $BASH_FILE 'GGACTGAAATCTG' 'GGACTGAAATCTG'

  assert_success
  assert_output "0"
}

@test 'long different strands' {
  run bash $BASH_FILE 'GGACGGATTCTG' 'AGGACGGATTCT'

  assert_success
  assert_output "9"
}

@test 'disallow first strand longer' {
  run bash $BASH_FILE 'AATG' 'AAA'

  assert_failure
  assert_output --partial "strands must be of equal length"
}

@test 'disallow second strand longer' {
  run bash $BASH_FILE 'ATA' 'AGTG'

  assert_failure
  assert_output --partial "strands must be of equal length"
}

@test 'disallow left empty strand' {
  run bash $BASH_FILE '' 'G'

  assert_failure
  assert_output --partial "strands must be of equal length"
}

@test 'disallow right empty strand' {
  run bash $BASH_FILE 'G' ''

  assert_failure
  assert_output --partial "strands must be of equal length"
}

@test "no input" {
  run bash $BASH_FILE

  assert_failure
  assert_output "Usage: hamming.sh <string1> <string2>"
}

@test "invalid input" {
  run bash $BASH_FILE 'A'

  assert_failure
  assert_output "Usage: hamming.sh <string1> <string2>"
}

@test "expose subtle '[[ \$x == \$y ]]' bug" {
  run bash $BASH_FILE 'AAA' 'A?A'

  assert_success
  assert_output "1"
}
