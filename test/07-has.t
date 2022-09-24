#!/usr/bin/env bash

source test/init

has "foo bar" "o b" \
  "'%G' has '%W'"

hasnt "foo bar" "xxx" \
  "'%G' hasnt '%W'"

done-testing
