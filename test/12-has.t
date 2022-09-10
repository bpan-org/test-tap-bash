#!/usr/bin/env bash

source test/init

has "foo bar" "o b" \
  "'%G' has '%W'"

done-testing
