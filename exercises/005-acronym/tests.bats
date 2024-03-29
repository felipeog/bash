#!/usr/bin/env bats

load "../../test/common-setup.sh"
load "../../test/get-test-folder.sh"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
BASH_FILE=$TEST_FOLDER/acronym.sh

setup() {
  common_setup
}

@test 'basic' {
  run bash $BASH_FILE 'Portable Network Graphics'

  assert_success
  assert_output 'PNG'
}

@test 'lowercase words' {
  run bash $BASH_FILE 'Ruby on Rails'

  assert_success
  assert_output 'ROR'
}

@test 'punctuation' {
  run bash $BASH_FILE 'First In, First Out'

  assert_success
  assert_output 'FIFO'
}

@test 'all caps word' {
  run bash $BASH_FILE 'GNU Image Manipulation Program'

  assert_success
  assert_output 'GIMP'
}

@test 'punctuation without whitespace' {
  run bash $BASH_FILE 'Complementary metal-oxide semiconductor'

  assert_success
  assert_output 'CMOS'
}

@test 'very long abbreviation' {
  run bash $BASH_FILE 'Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me'

  assert_success
  assert_output 'ROTFLSHTMDCOALM'
}

@test "consecutive delimiters" {
  run bash $BASH_FILE "Something - I made up from thin air"

  assert_success
  assert_output "SIMUFTA"
}

@test "apostrophes" {
  run bash $BASH_FILE "Halley's Comet"

  assert_success
  assert_output "HC"
}

@test "underscore emphasis" {
  run bash $BASH_FILE "The Road __Not__ Taken"

  assert_success
  assert_output "TRNT"
}

@test "contains shell globbing character" {
  run bash $BASH_FILE "Two * Words"

  assert_success
  assert_output "TW"
}
