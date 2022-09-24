#!/usr/bin/env bash

source test/init

try ls /foobarbaz

ok "$([[ $got == *No\ such\ file* ]])" \
  "'try' with bad command works"

isnt "$rc" 0 \
  "'$cmd' return code is not 0"

is "$cmd" "ls /foobarbaz" \
  "\$cmd is set correctly"

done-testing
