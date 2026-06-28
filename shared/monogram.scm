(require "../framework-src/svg.scm")

(define (declare-monogram)
  (paste "monogram.svg"))

(define (monogram)
  (<svg> ((class "monogram")
          (viewBox "0 0 4.466 5")
          (aria-label "Peter Elliott"))
    (<use> ((href "#monogram")))))


(define (monogram-css)
  (css "/css/monogram.css"))
