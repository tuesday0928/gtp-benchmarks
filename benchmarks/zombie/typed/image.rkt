#lang typed/racket/base

;; Placeholder for images.
;; Pretends to render data.

(provide
 (struct-out image)
 empty-scene ;(number? number? . -> . image?)]
 place-image ;(image? number? number? image? . -> . image?)]
 circle      ;(number? string? string? . -> . image?)]
)

;; =============================================================================

(struct image (
 [impl : Any]
))
(define-type Image image)

(: empty-scene (-> Real Real Image))
(define (empty-scene w h)
  (when (or (negative? w) (negative? h))
    (error 'image "Arguments must be non-negative real numbers"))
  (image (cons w h)))

(: place-image (-> Image Real Real Image Image))
(define (place-image i1 w h i2)
  (image (list i1 w h i2)))

(: circle (-> Real String String Image))
(define (circle radius style color)
  (image (list radius style color)))
