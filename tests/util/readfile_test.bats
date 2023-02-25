#!/usr/bin/env bats

load "$BASH_BOOST/src/util/list.sh"

@test "readfile reads lines from file" {
  testfile="$BASH_BOOST/tests/util/sample_file.txt"
  result="$(readfile $testfile)"
  [ "$result" = "one two three" ]
}

@test "readfile reads lines from stdin" {
  result="$(echo -e 'one\ntwo\nthree' | readfile)"
  [ "$result" = "one two three" ]
}

@test "readfile returns empty list for empty input" {
  result="$(echo -n | readfile)"
  [ "$result" = "" ]
}

@test "readfile returns error for non-existent file" {
  result="$(readfile nonexistentfile)"
  [ "$result" = "" ]
}
