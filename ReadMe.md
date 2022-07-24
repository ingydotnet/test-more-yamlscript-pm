Test::More::YAMLScript
======================

Write Perl tests in YAMLScript

## Synopsis

A file `t/test.t`:
```
#!/usr/bin/env test-more-yamlscript

- plan: 10

- pass: This test will always 'pass'

- todo:
  - Testing 'todo'
  - fail: This test will always 'fail'

- note: "NOTE: This is awesome"

- diag: This is a WARNING!

- ok:
  - true
  - Testing 'ok'

- is:
  - add: [2, 2]
  - 4
  - 2 + 2 'is' 4

- isnt:
  - add: [2, 2]
  - 5
  - 2 + 2 'isnt' 5

- like:
  - I like pie!
  - /\blike\b/
  - Testing 'like'

- unlike:
  - Please like me on Facebook
  - /\bunlike\b/
  - Testing 'unlike'

- skip:
  - Skipping - Highway to the danger zone
  - danger: zone

- subtest:
  - Testing skip-all in subtest
  - skip-all: Skipping all these subtests
  - pass: I wanna pass...
  - fail: Gonna fail...

- subtest:
  - Testing 'subtests'
  - for:
    - [1, 2, 3]
    - pass: Subtest $_
  - done-testing: 3
```

Run `prove t/test.t`:
```
test/more.t .. 
1..10
ok 1 - This test will always 'pass'
not ok 2 # TODO & SKIP Testing 'todo'
# NOTE: This is awesome
ok 3 - Testing 'ok'
ok 4 - 2 + 2 'is' 4
# This is a WARNING!
ok 5 - 2 + 2 'isnt' 5
ok 6 - Testing 'like'
ok 7 - Testing 'unlike'
ok 8 # skip Skipping - Highway to the danger zone
# Subtest: Testing skip-all in subtest
    1..0 # SKIP Skipping all these subtests
ok 9 # skip Skipping all these subtests
# Subtest: Testing 'subtests'
    ok 1 - Subtest 1
    ok 2 - Subtest 2
    ok 3 - Subtest 3
    1..3
ok 10 - Testing 'subtests'
ok
All tests successful.
Files=1, Tests=10,  0 wallclock secs ( 0.01 usr  0.00 sys +  0.10 cusr  0.00 csys =  0.11 CPU)
Result: PASS
```

## Description

Test::More::YAMLScript let's you write Perl module tests in YAMLScript.

You just add this shebang line to a `t/test-file.t`:
```
#!/usr/bin/env test-more-yamlscript
```

## Authors

* Ingy döt Net <ingy@ingy.net>

## Copyright and License

Copyright 2022 by Ingy döt Net

This library is free software and may be distributed under the same terms as
perl itself.
