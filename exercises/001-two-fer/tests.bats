#!/usr/bin/env bats

load "../../test/common-setup.sh"
load "../../test/get-test-folder.sh"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
BASH_FILE=$TEST_FOLDER/two-fer.sh

setup() {
  common_setup
}

@test "no name given" {
  run bash $BASH_FILE

  assert_success
  assert_output "One for you, one for me."
}

@test "a name given" {
  run bash $BASH_FILE Alice

  assert_success
  assert_output "One for Alice, one for me."
}

@test "another name given" {
  run bash $BASH_FILE Bob

  assert_success
  assert_output "One for Bob, one for me."
}

@test "handle arg with spaces" {
  run bash $BASH_FILE "John Smith" "Mary Ann"

  assert_success
  assert_output "One for John Smith, one for me."
}

@test "handle arg with glob char" {
  run bash $BASH_FILE "* "

  assert_success
  assert_output "One for * , one for me."
}
