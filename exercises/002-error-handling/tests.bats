#!/usr/bin/env bats

load "../../test/common-setup.sh"
load "../../test/get-test-folder.sh"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
BASH_FILE=$TEST_FOLDER/error-handling.sh

setup() {
  common_setup
}

@test "correct arguments" {
  run bash $BASH_FILE Alice

  assert_success
  assert_output "Hello, Alice"
}

@test "one long argument" {
  run bash $BASH_FILE "Alice and Bob"

  assert_success
  assert_output "Hello, Alice and Bob"
}

@test "incorrect arguments" {
  run bash $BASH_FILE Alice Bob

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

@test "print usage banner with no value given" {
  run bash $BASH_FILE

  assert_failure
  assert_output "Usage: error_handling.sh <person>"
}

@test "empty argument" {
  run bash $BASH_FILE ""

  assert_success
  assert_output "Hello, "
}
