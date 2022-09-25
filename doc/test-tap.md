test-tap-bash
==============

TAP Testing for Bash


## Synopsis

Write a test file like this.
Maybe call it `test/test.t`:
```
#!/usr/bin/env bash

source bpan.bash --
bpan:source test-tap

plan 10

ok "$(some-command)" 'some-command is ok'

# or:
try some-command
ok "$rc" \
   'some-command is ok'

try some-bad-command --so-bad
has "$got" "bad bad bad" \
  "some-bad-command error msg contained 'bad bad bad'"

pass 'This will always pass'

fail 'This will always fail'

is $(echo foo) 'foo' \
   'foo is foo'

isnt foo bar \
  "%G isn't %W"  # "foo isn't bar"

like food foo \
  'food is like foo'

unlike team I \
  "There's no 'I' in 'team'"

diag "A message for stderr"

note "A message for stdout"

output=( $(ls) )
expected=(README lib bin)
array:is output expected \
  "list files"
```

Run the test with `prove` like this:
```
prove test/
prove -v test/test.t
```

`prove` knows it's Bash from the first line (the shebang), and it just works.

You may also run the tests with `bpan test ...` which just calls `prove ...`.

BPAN modules generally have a Makefile where `make test` calls `bpan test -v
test/`.


## Description

[Test::More](https://metacpan.org/pod/Test::More) is the tried and true testing
library for Perl.
It uses TAP (the Test Anything Protocol).
This is the same thing for Bash.
For the most part it should work exactly the same.


## Test TAP API Functions

In functions with `[<label>]`, the label is a (optional) string describing the
test that gets printed when the tests are run with verbose (`-v`) output.

The special "variables" `%G` and `%W` expand to the `got` and `want` string
values respectively.

NOTE: The got and want values may be altered to fit better in a label string.

* `plan <number>`

  Declare the expected number of tests to be run.
  If used, must be called before other functions.
  If not used, you must call `done-testing` at the end.

* `plan skip-all [<reason>]`

  Use this version of `plan` if it is determined that the tests should NOT be
  run for some reason.
  Possible reasons are things like a missing command or a certain operating
  system.

  Can also be called using `skip-all [<reason>]`.

* `done-testing [<number>]`

  Declare that all tests have been run, optionally with the expected number.
  If used, must be called after all other assertion functions.
  If not used, you must call `plan` at the start.

* `bail-on-fail`

  Use this function to declare that any subsequent test failures should
  terminate the rest of the test script.

* `try <some command --with=options>`

  Try will run a command in a safe way and return the combined stdout and
  stderr in a variable called `got`.
  It will also put the status (return) code in a variable called `rc`.
  This is very useful for testing error messages without having the test script
  error out.

* `pass [<label>]`

  An explicit passing test.

* `fail [<label>]`

  An explicit failing test.

* `ok "$(<cmd>)" [<label>]`

  Pass if cmd runs with a 0 (zero) exit status.
  You may also call `ok` with a status code (0-255) instead of a command.
  Commands should be formatted like: `"$( command args... )"`; that is wrapped
  in `"$(...)"` (with actual double quotes).

* `not-ok "$(<cmd>)" [<label>]`

  Pass if cmd runs with a non-zero exit status.
  Same rules as `ok`, but meaning is opposite.

* `is <got> <want> [<label>]`

  Pass if got is equal to want.
  If want is a multiline string, print a unified diff on failure.

* `isnt <got> <unwanted> [<label>]`

  Pass if got is NOT equal to want.
  Opposite of `is`.

* `like <got> <regex> [<label>]`

  Pass if got matches regex (bash regular expression).

* `unlike <got> <regex> [<label>]`

  Pass if got doesn't match regex (bash regular expression).
  Opposite of `like`.

* `has <got> <want> [<label>]`

  Pass if got contains the want string.

* `hasnt <got> <want> [<label>]`

  Pass if got does NOT contain the want string.
  Opposite of `has`.

* `array:is <got-array-var-name> <want-array-var-name> [<label>]`

  Pass if the got array has content equal to the want array.

* `diag <msg>`

  Print a message to stderr in a way that the harness knows how to process.

* `note <msg>`

  Print a message to stdout in a way that the harness knows how to process.

* `bail-out [<reason>]`

  Stop the test script in a way that the harness knows how to process.

### File System Test Functions

Functions called `ok-?` are really just calling `[[ -? ... ]]`.
For example `ok-f /path/to/file` calls `[[ -f /path/to/file ]]`.

You can use a label for the following test funtions, but they will create
appropriate labels for you if you don't.
Therefore best practice is to not use labels when calling the following
functions.

* `ok-d <path>`

  Pass if path is an existing directory (or a link to a directory).

* `ok-e <path>`

  Pass if path exists.

* `ok-not-e <path>`

  Pass if path does NOT exist.

* `ok-empty <path>`

  Pass if path is an empty file or directory.

* `ok-f <path>`

  Pass if path is a file (or a link to a file).

* `ok-h <path>`

  Pass if path is a symlink.

* `ok-s <path>`

  Pass if path is a non-empty file.

* `ok-w <path>`

  Pass if path is writable.

* `ok-x <path>`

  Pass if path is executable.

## Author

Ingy döt Net <ingy@ingy.net>


## Copyright & License

Copyright 2013-2022 - Ingy döt Net

The MIT License (MIT)
