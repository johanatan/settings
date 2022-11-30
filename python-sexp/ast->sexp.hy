#!/usr/bin/env hy
(import ast sys os)

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

(when (= __name__ "__main__")
  (print (parse-file (if (= 1 (len sys.argv)) "stdin" (get sys.argv 1)))))
