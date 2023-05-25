Test::More::YAMLScript
======================

Write Perl tests in YAMLScript


## Synopsis

A file `t/test.t`:

```
#!/usr/bin/env test-more-yamlscript

plan: 11

pass: "This test will always 'pass'"

note: "The next test has no label:"

pass: []

todo:
- "Testing 'todo'"
- fail: "This test will always 'fail'"

note: "NOTE: This is awesome"

diag: "This is a WARNING!"

ok: [true, "Testing 'ok'"]

is:
- (2 + 2)
- 4
- "2 + 2 'is' 4"

isnt:
- (2 + 2)
- 5
- "2 + 2 'isnt' 5"

like:
- "I like pie!"
- /\blike\b/
- "Testing 'like'"

unlike:
- "Please like me on Facebook"
- /\bunlike\b/
- "Testing 'unlike'"

skip:
- "Skipping - Highway to the danger zone"
- danger: zone

subtest:
- "Testing skip-all in subtest"
- skip-all: "Skipping all these subtests"
- pass: "I wanna pass..."
- fail: "Gonna fail..."

subtest:
- "Testing 'subtests'"
- pass: "Subtest 1"
- pass: "Subtest 2"
- pass: "Subtest 3"
- done-testing: 3
```

Run `prove -v t/test.t`:
```
t/test.t ..
1..11
ok 1 - This test will always 'pass'
# The next test has no label:
ok 2
not ok 3 # TODO & SKIP Testing 'todo'
# NOTE: This is awesome
# This is a WARNING!
ok 4 - Testing 'ok'
ok 5 - 2 + 2 'is' 4
ok 6 - 2 + 2 'isnt' 5
ok 7 - Testing 'like'
ok 8 - Testing 'unlike'
not ok 9 # TODO & SKIP Skipping - Highway to the danger zone
# Subtest: Testing skip-all in subtest
    1..0 # SKIP Skipping all these subtests
ok 10 # skip Skipping all these subtests
# Subtest: Testing 'subtests'
    ok 1 - Subtest 1
    ok 2 - Subtest 2
    ok 3 - Subtest 3
    1..3
ok 11 - Testing 'subtests'
ok
All tests successful.
Files=1, Tests=11,  1 wallclock secs ( 0.02 usr  0.01 sys +  0.28 cusr  0.01 csys =  0.32 CPU)
Result: PASS
```

Also works with `yath t/test.t`.


## Description

Test::More::YAMLScript lets you write Perl module tests in YAMLScript.

You just add this shebang line to a `t/test-file.t`:
```
#!/usr/bin/env test-more-yamlscript
```


## See Also:

* [YAMLScript](https://metacpan.org/pod/Test::More::YAMLScript)
* [Lingy](https://metacpan.org/pod/Lingy)


## Authors

* Ingy döt Net <ingy@ingy.net>


## Copyright and License

Copyright 2022-2023 by Ingy döt Net

This library is free software and may be distributed under the same terms as
perl itself.
