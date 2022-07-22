#!/usr/bin/env test-more-yamlscript

- plan: 8

# TODO
# - if:
#   - (==): [$sys/env:OSNAME, Plan9]
#   - skip-all: 9 is not my Plan

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

# TODO
# - subtest:
#   - Testing subtests:
#   - do:
#     - plan: 3
#     - for:
#       - [1, 2, 3]
#       - pass: Subtest $_

# - subtest:
#   - Testing skip-all in subtest
#   - do:
#     - skip-all: Skipping all these subtests
#     - pass: I wanna pass...
#     - pass: I wanna pass two...

# - done-testing: 8
