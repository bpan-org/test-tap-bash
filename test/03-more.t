#!/usr/bin/env bash

source test/init

plan 6

pass 'This test always passes'

is 'foo' "foo" 'foo is foo'

ok "$(true)" 'true is true'

ok "$([ 123 -eq "$((61+62))" ])" 'Math works'

# shellcheck disable=2050
ok "$([[ ! team =~ I ]])" "There's no I in team"

# diag "A msg for stderr"

note "A msg for stdout"

expected=(line1 line2)

command_output=(line1 line2)
array:is command_output expected "command output more"
