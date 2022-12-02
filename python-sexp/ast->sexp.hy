#!/usr/bin/env hy
(import ast functools itertools os sys)

(defn parse-file [filename]
  (let [contents
        (try
          (with [f (open filename "r")]
            (.read f))
          (except [IOError]
            (if (!= filename "stdin")
                (raise)
                (do
                  (.write sys.stdout "Reading from stdin (CTRL+D to end):\n")
                  (.read sys.stdin)))))]
    (ast.parse contents filename)))

(defn identity [x] x)

(defn concat [seqs]
  (itertools.chain.from_iterable seqs))

(defn mapcat [f seq]
  (concat (map f seq)))

(defn first [seq]
  (when (> (len seq) 0)
    (get seq 0)))

(defn rest [seq]
  (cut seq 1 (len seq)))

(defn apply [f args]
  (if (= 0 (len args))
      (f)
      (apply (functools.partial f (first args)) (rest args))))

(defn merge [#* dicts]
  (dict (mapcat (fn [d] (.items d)) dicts)))

(defn dissoc [d #* keys]
  (dict
    (mapcat
      (fn [i]
        (if (in (get i 0) keys) [] [i]))
      (.items d))))

(defn str [#* args]
  (.join "" args))

(defn drepr [v]
  (if (isinstance v (type "")) (str "\"" v "\"") (repr v)))

(defclass sexp-list [list]
  (defn __repr__ [self]
    (if (= 0 (len self))
        "[]"
        (str "(" (.join " " (map drepr self)) ")"))))

(defclass sexp-dict [dict]
  (defn __repr__ [self]
    (let [pair-repr (fn [i] (str (drepr (get i 0)) ": " (drepr (get i 1))))]
      (str "{" (.join " " (map pair-repr (.items self))) "}"))))

(defn sexp [node]
  (let [t (type node)
        ignore-fields #{"lineno" "col_offset" "end_lineno" "end_col_offset"}]
    (sexp-list
      [t.__name__
       (sexp-dict
         (apply (functools.partial dissoc (vars node)) (list ignore-fields)))])))

(defclass SexpTransformer [ast.NodeTransformer]
  ;; the following is the hy implementation of:
  ;; https://github.com/python/cpython/blob/main/Lib/ast.py#L489-L509
  (defn generic-visit [self node]
    (for [[field old-value] (ast.iter-fields node)]
      (cond
        (isinstance old-value list)
        (let [new-values
              (sexp-list
                (mapcat identity
                        (hy.pyops.reduce
                          (fn [acc v]
                            (let [new-value
                                  (if (isinstance v ast.AST)
                                      (let [v (.visit self v)]
                                        (cond
                                          (is None v) []
                                          (isinstance v ast.AST) [[v]]
                                          True [v]))
                                      [v])]
                              (.extend acc new-value)
                              acc))
                          old-value
                          [])))]
          (setattr node field new-values))
        (isinstance old-value ast.AST)
        (let [new-node (.visit self old-value)]
          (if (is new-node None)
              (delattr node field)
              (setattr node field new-node)))))
    node)
  (defn visit [self node]
    (.generic-visit self node)
    (sexp node)))

(when (= __name__ "__main__")
  (print (parse-file (if (= 1 (len sys.argv)) "stdin" (get sys.argv 1)))))
