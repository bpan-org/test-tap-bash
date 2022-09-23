#!/usr/bin/env bash

source test/init

note "Next test 'is' without label"
is foo foo
is foo foo "is() with label"

note "Next test 'isnt' without label"
isnt foo goo
isnt foo goo "isnt() with label"

done-testing
