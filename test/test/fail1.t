#!/usr/bin/env bash

# shellcheck disable=2034

source test/init

fail 'fail with label'

fail

is foo bar 'is foo bar'

expected=(line1 line2)

command_output=(line1 line2 line3)
array:is command_output expected "command output more"

command_output=(line1)
array:is command_output expected "command output less"

command_output=(line1 foo)
array:is command_output expected "command output diff"

done_testing 6
