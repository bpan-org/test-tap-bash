#!/usr/bin/env bash

source test/init

ok-d test
ok-e Meta
ok-not-e Umbrella
ok-f ReadMe.md
ok-h .bpan/config
ok-s Changes

f=$(mktemp)
ok-empty "$f"
rm -f "$f"

f=$(mktemp -d)
ok-empty "$f"
rm -fr "$f"

done-testing
