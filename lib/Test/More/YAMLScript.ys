(ns Test.More.YAMLScript
  (:use lingy.Util)
  (:import Test.Builder))

(def t (.new Test.Builder))
(.level t 2)

(defn plan [count]
  (.plan t "tests" count))

(defn pass
  ([]
    (.ok t true))
  ([label]
    (.ok t true label)))

(defn fail
  ([]
    (.ok t nil))
  ([label]
    (.ok t nil label)))

(defn note [msg]
  (.note t msg))

(defn diag [msg]
  (.diag t msg))

(defn ok
  ([cond]
    (.ok t cond))
  ([cond label]
    (.ok t cond label)))

(defn is
  ([got want]
    (.is_eq t got want))
  ([got want label]
    (.is_eq t got want label)))

(defn isnt
  ([got want]
    (.isnt_eq t got want))
  ([got want label]
    (.isnt_eq t got want label)))

(defn like
  ([str rgx]
    (.like t str rgx))
  ([str rgx label]
    (.like t str rgx label)))

(defn unlike
  ([str rgx]
    (.unlike t str rgx))
  ([str rgx label]
    (.unlike t str rgx label)))

(defmacro todo [label & tests]
  `(.todo_skip t ~label))

(defmacro skip [label & tests]
  `(.todo_skip t ~label))

(defn skip-all [label]
  (.skip_all t label))

(defmacro subtest [label & tests]
  `(.subtest Test.More.YAMLScript t ~label '~tests))

(defn done-testing
  ([]
    (.done_testing t))
  ([num]
    (.done_testing t num)))
