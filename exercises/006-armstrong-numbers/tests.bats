#!/usr/bin/env bats

load "../../test/common-setup.sh"
load "../../test/get-test-folder.sh"

TEST_FOLDER=$(get_test_folder $BATS_TEST_FILENAME)
BASH_FILE=$TEST_FOLDER/armstrong-numbers.sh

setup() {
  common_setup
}

@test 'Zero is Armstrong numbers' {
  run bash $BASH_FILE 0
  
  assert_success
  assert_output "true"
}

@test 'Single digits are Armstrong numbers' {
  run bash $BASH_FILE 5
  
  assert_success
  assert_output "true"
}

@test 'There are no two digit Armstrong numbers' {
  run bash $BASH_FILE 10
  
  assert_success
  assert_output "false"
}

@test 'A three digit number that is an Armstrong number' {
  run bash $BASH_FILE 153
  
  assert_success
  assert_output "true"
}

@test 'A three digit number that is not an Armstrong number' {
  run bash $BASH_FILE 100
  
  assert_success
  assert_output "false"
}

@test 'A four digit number that is an Armstrong number' {
  run bash $BASH_FILE 9474
  
  assert_success
  assert_output "true"
}

@test 'A four digit number that is not an Armstrong number' {
  run bash $BASH_FILE 9475
  
  assert_success
  assert_output "false"
}

@test 'A seven digit number that is an Armstrong number' {
  run bash $BASH_FILE 9926315
  
  assert_success
  assert_output "true"
}

@test 'A seven digit number that is not an Armstrong number' {
  run bash $BASH_FILE 9926314
  
  assert_success
  assert_output "false"
}
