;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: Collatz Shoreline
;;;
;;; Description:
;;;   so much depends on
;;;   a recursive beach, birds-eye
;;;   speckled with palm trees
;;;
;;;   ALTERNATE:
;;;   the awakening
;;;   the stranger, the collector-
;;;   girl, all do CS.

; pre-definitions!
(bgcolor "#067b84")
(color "white")
(define leftedge (/ (screen_width) 2))
(define topedge (/ (screen_height) 2))
(speed 10)

; functions!
(define (collatz sequence)
  (if (odd? sequence)
    (+ 1 (* sequence 3))
    (/ sequence 2)
  )
)

; draws the waves!
(define (shoreline shorelength wavelength)
  (if (> shorelength (- 0 topedge))
    (begin
      (penup)
      (setposition (- 0 leftedge) shorelength)
      (pendown)
      (forward wavelength)
      (define new_shorelength (- shorelength 15))
      (shoreline new_shorelength (collatz wavelength))
    )
  )
)

; draws the shore!
(define (reversecollatz shorelength wavelength)
  (if (> shorelength (- 0 topedge))
    (begin
      (penup)
      (setposition leftedge (+ shorelength 2))
      (pendown)
      (begin_fill)
        ; makes rectangles!
        (setheading 270)
        (forward (/ (- (* 2 leftedge) wavelength) 3))
        (setheading 180)
        (forward 4)
        (setheading 90)
        (forward (/ (- (* 2 leftedge) wavelength) 3))
        (setheading 0)
        (forward 4)
      (end_fill)
      (reversecollatz (- shorelength 15) (collatz wavelength))
    )
  )
)


(define (draw)
  (hideturtle)
  (penup)
  (setheading 90)
  (shoreline topedge 370)
  (left 270)
  (color "#daa520")
  (reversecollatz topedge 370)

  ; palm trees!
  (pendown)
  (pixelsize 15)
  (pixel 41 24 "#148f2f")
  (pixel 37 12 "#0e6220")
  (pixel 39 7 "#0e624a")

  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
