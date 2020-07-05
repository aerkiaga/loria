(require-macros :useful-macros)

(define-type node-table
  (λ [cls self]
    (set (self.nodes
          self.node-count
          self.components)
         (values {} 0 0))))

(fn node-table.add-to-nodes [self node-str]
  (when (= (. self.nodes node-str) nil)
    (tset self.nodes node-str self.node-count)
    (set self.node-count (+ self.node-count 1)))
  (. self.nodes node-str))

(fn map-nodes [circ]
  (local tbl (node-table))
  (tbl:add-to-nodes :gnd)

  (each [_ elem (ipairs circ)]
    (set tbl.components (+ tbl.components 1))
    (tset tbl elem.type (+ (or (. tbl elem.type) 0) 1))
    (set elem.high (tbl:add-to-nodes elem.pos-node))
    (set elem.low  (tbl:add-to-nodes elem.neg-node)))

  tbl)

(fn init-matrix-by-func [self func]
  (for [i 1 self.size.width]
    (tset self i [])
    (for [j 1 self.size.height]
      (tset self i j (func i j)))))

(define-type matrix
  (λ [cls self n m]
    (let [size (* n m)]
      (set self.data (allocate "complex[?]" size))
      (set self.size {:width m :height n}))))

(fn matrix.idx [self i j]
  (+ (* (- i 1) self.size.width) (- j 1)))

(fn matrix.get [self i j]
  (. self.data (matrix.idx self i (or j 1))))

(fn matrix.set [self i j val]
  (tset self.data (matrix.idx self i (or j 1)) val))

(fn matrix.print [self]
  (for [i 1 self.size.width]
    (for [j 1 self.size.height]
      (io.write (self:get i j) " "))
    (io.write "\n")))

(fn calculate-resistor [A b elem g2-index]
  (when (≠ elem.high 0)
    (A:set elem.high elem.high
      (+ (A:get elem.high elem.high)
         (/ 1 elem.value))))
  (when (≠ elem.low 0)
    (A:set elem.low elem.low
      (+ (A:get elem.low elem.low)
         (/ 1 elem.value))))
  (when (∧ (≠ elem.high 0) (≠ elem.low 0))
    (A:set elem.high elem.low
      (- (A:get elem.high elem.low)
         (/ 1 elem.value)))
    (A:set elem.low elem.high
      (- (A:get elem.low elem.high)
         (/ 1 elem.value)))))

(fn calculate-voltage [A b elem g2-index]
  (when (≠ elem.high 0)
    (A:set elem.high g2-index
      (+ (A:get elem.high g2-index) 1))
    (A:set g2-index elem.high
      (+ (A:get g2-index elem.high) 1)))

  (when (≠ elem.low 0)
    (A:set elem.low g2-index
      (- (A:get elem.low g2-index) 1))
    (A:set g2-index elem.low
      (- (A:get g2-index elem.low) 1)))

  (b:set g2-index 1 elem.value)
  (+ g2-index 1))

(fn calculate-current [A b elem g2-index]
  (when (≠ elem.high 0)
    (b:set elem.high 1 (- (b:get elem.high 1) elem.value)))
  (when (≠ elem.low 0)
    (b:set elem.low 1 (+ (b:get elem.low 1) elem.value))))

(local circuit-elems
  {:resistor calculate-resistor
   :voltage  calculate-voltage
   :current  calculate-current})

(fn solve-aux [tbl circ]
  (let [g2-count (+ tbl.voltage (or tbl.inductor 0))
        matrix-size (+ tbl.node-count g2-count -1)]

    (var A (matrix matrix-size matrix-size))
    (var b (matrix matrix-size 1))

    (var g2-index (- matrix-size g2-count -1))
    ;; generate A and b
    (each [id elem (ipairs circ)]
      (let [func (. circuit-elems elem.type)]
        (local maybe-g2-index (func A b elem g2-index))
        (when (~= maybe-g2-index nil)
          (set g2-index maybe-g2-index)
          (set elem.current-index (- maybe-g2-index 1)))))

    ;; Ax = b ⇒ x = A⁻¹ × b
    (local solution (linsolve A b))

    (var res {:voltages {} :currents {}})
    ;; make “node — voltage” table
    (each [name pin (pairs tbl.nodes)]
      (let [v (or (solution:get pin 1) (complex 0 0))]
        (tset res.voltages name v)))

    ;; make “source — current” table
    (each [id elem (ipairs circ)]
      (when (~= elem.current-index nil)
        (tset res.currents elem.name
          (solution:get elem.current-index 1))))

    res))

(defun circsolve [circ] (solve-aux (map-nodes circ) circ))