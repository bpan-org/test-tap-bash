#!/usr/bin/env bash

source test/init

try pass yep

is \
  "$got" \
  "Error: Called test-tap method from a subprocess" \
  "Can't use test functions from subshells"

done-testing
