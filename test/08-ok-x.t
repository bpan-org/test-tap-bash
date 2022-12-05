#!/usr/bin/env bash

source test/init

ok-d test
ok-e .bpan/config
ok-not-e Umbrella
ok-f ReadMe.md
ok-s Changes

f=$(mktemp)
ok-empty "$f"
rm -f "$f"

f=$(mktemp -d)
ok-empty "$f"
rm -fr "$f"

done-testing
