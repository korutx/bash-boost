#!/bin/bash

# readfile - reads a file and returns its contents as a list of strings
# Usage: readfile [file]
# If [file] is not provided, read from standard input
# Returns a list of strings, with each line of the file as a separate string

readfile() {
  # Read the file into a variable
  local input
  if [[ -n "$1" ]]; then
    input="$(cat "$1")"
  else
    input="$(cat -)"
  fi

  # Convert the input into a list of strings
  local list=()
  while IFS= read -r line; do
    list+=("$line")
  done <<< "$input"

  echo "${list[@]}"
}
