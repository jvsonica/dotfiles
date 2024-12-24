#!/bin/bash

# Initialize the output string
output=""

# Store the result of filtering DB and rds.amazon into a variable
env_vars=$(env | grep -E "DB" | grep -E "rds\.amazon")

# Check if any environment variables match the DB and rds.amazon criteria
if [[ -n "$env_vars" ]]; then
  # Now check for "ro" in the filtered variables and append to output if found
  if echo "$env_vars" | grep -q "ro"; then
    output="$output  RO"
  fi

  # Now check for "rw" in the filtered variables and append to output if found
  if echo "$env_vars" | grep -q "rw"; then
    output="$output  RW"
  fi

  # Now check for "admin" in the filtered variables and append to output if found
  if echo "$env_vars" | grep -q "admin"; then
    output="$output  ADMIN"
  fi
fi

# If output contains any matches, print the result
if [[ -n "$output" ]]; then
  echo "$output"
fi
