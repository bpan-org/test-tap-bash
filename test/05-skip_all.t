#!/usr/bin/env bash

source test/init

output=$(prove -v test/test/skip_all.t 2>&1) || true

like "$output" 'skipped: Skipping this test to demo skip_all' \
    'skip_all works'

done-testing 1
