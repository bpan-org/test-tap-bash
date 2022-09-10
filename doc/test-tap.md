test-tap-bash
==============

TAP Testing for Bash

## Synopsis

Write a test file like this.
Maybe call it `test/test.t`:
```
#!/usr/bin/env bash

source bpan.bash --prelude

bpan:use test-tap

plan 10

some-command
ok $? 'some-command is ok'

# or:
ok "`some-command`" 'some-command is ok'

pass 'This will always pass'

fail 'This will always fail'

is `echo foo` 'foo' 'foo is foo'

isnt foo bar "foo isn't bar"

like food foo 'food is like foo'

unlike team I "There's no 'I' in 'team'"

diag "A message for stderr"

note "A message for stdout"

output=( $(ls) )
expected=(README lib bin)
cmp-array output expected "list files"

try ls /not/a/file
has "$out" "No such file" \
  "Output has substring '%W'"
isnt "$rc" 0 \
  "'$cmd' return code is not 0"
```

Run the test with `prove` like this:
```
prove test/test.t
```

Prove knows it's Bash from the first line (the hashbang), and it just works.

## Description

[Test::More](https://metacpan.org/pod/Test::More) is the tried and true testing
library for Perl.
It uses TAP (the Test Anything Protocol).
This is the same thing for Bash.
For the most part it should work exactly the same.

## Methods

This is the basic usage:

* `plan $count`
* `ok $status_code "$label"`
* `pass "$label"`
* `fail "$label"`
* `is "$got" "$want" "label"`
* `isnt "$got" "$unwanted" "$label"`
* `like "$got" "$regex" "$label"`
* `unlike "$got" "$regex" "$label"`
* `diag "$message"`
* `note "$message"`
* `done_testing $count`
* `plan skip_all "$reason"`
* `BAIL_OUT "$reason"`
* `cmp-array output expected "message"`
* `try some command --with=options`
* `has "$out" "some substring" "$label"`

More detailed info coming soon.

## Author

Ingy döt Net <ingy@ingy.net>

## Copyright & License

Copyright 2013-2022 - Ingy döt Net

The MIT License (MIT)
