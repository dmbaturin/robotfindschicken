;;; TODO: come up with a better name

;;;; Preliminary procedures

(define (repeat f n) ; run the procedure f n times
  (if (= n 1)
      (f)
      ((lambda ()
         (f)
         (repeat f (sub1 n))))))

;;;;


;;;; Constant values

(define-constant *frame-colour*   1)
(define-constant *decor-colour*   2)
(define-constant *chicken-colour* 3)
(define-constant *message-colour* 4)
(define-constant *help-colour*    5)
(define-constant *control-colour* 6)
(define-constant *extra-colour*   7)
(define-constant *robot-colour*   8)

(define-constant messages
  '("A bottle of a soft drink. Warm and flat."
    "An action figure of Guy Steele, 1:18 scale."
    "This is a VAXServer running OpenVMS 8.3."
    "A potted plant of dubious legality. It needs watering."
    "A picture of a woman wearing a hat with feathers. Compression artifacts distorted her face but it looks familiar."
    "A 3D model of a bunny containing 69451 polygons. You do not feel like verifying that claim."
    "This is a Canterbury corpus in folio, bound in leather of Stanford bunnies."
    "This is almost a chicken, but not quite. Try harder."
    "A cheque from Donald Knuth, for one hexadecimal dollar."
    "This is a teapot. You are certain that you've seen it somewhere."
    "A semi-automatic, conservatory key system oboe."
    "A well-worn set of Slackware 1.0.0 installation floppy set."
    "An EBCDIC-art picture of a naked woman printed with a line printer."
    "An ANSI-art picture of a naked man printed with a dot-matrix printer."
    "An ASCII-art picture of a naked person printed with a daisy-wheel printer."
    "One of Paul Graham's oil paintings."
    "An empty set. It's barely visible."
    "A LART made from depleted uranium."
    "There is absolutely nothing here.                       (fnord?)"
    "You have no idea what this it, but you hope it's not what it looks like."
    "This is a cheap knock-off of the platinum-iridium kilogramme standard."
    "These are two bodies connected by a weightless string."
    "A gift-wrapped set of straightedge and compasses."
    "A handheld electronic console 'Game of Life'. Glidey!"
    "A finite state machine. It appears to have stopped. Problematic."
    "A fork that once belonged to one of the dining philosophers."
    "This is a sleeping barber. Don't touch his locks."
    "A +0 uncursed cockatrice corpse."
    "A defiled altar formerly dedicated to the god of IT security."
    "An electric cdr."
    "It's a sleeping daemon."
    "An old keyboard. The hyper key seems to be missing."))

(define-constant chars
  '(#\! #\@ #\# #\$ #\% #\& #\*
    #\/ #\= #\? #\+ #\- #\_ #\\
    #\| #\' #\, #\. #\; #\: #\"
    #\< #\> #\` #\~))

;;;;


;;;; Record definitions

(define-record item
  row col row-prev col-prev
  moved? message colour char)

(define-record-type item
  (spawn-item row col row-prev col-prev
              moved message colour char)
  item?
  (row row-get row-set!)
  (col col-get col-set!)
  (row-prev row-prev-get row-prev-set!)
  (col-prev col-prev-get col-prev-set!)
  (moved moved? moved!)
  (message message-get message-set!)
  (colour colour-get colour-set!)
  (char char-get char-set!))

;;;;


;;;; Internal procedures

;;; Get random coordinates
(define (random-row)
  (+ 3 (random (- (LINES) 5))))
(define (random-col)
  (+ 1 (random (- (COLS) 2))))
(define (random-elem lst)
  (list-ref lst (random (length lst))))

;;; Generate a number of locations to place non-robot non-chicken items
(define (generate-items count)
  (if (not (zero? (sub1 count)))
      (cons (spawn-item
             (random-row) (random-col) 0 0
             #f (random-elem messages)
             (add1 (random 7)) ; Random colour
             (random-elem chars))
            (generate-items (sub1 count)))
      '()))

(define (quit-game message code)
  ;; Stop input to avoid cluttering the terminal
  (flushinp)
  (attroff A_BOLD)
  (clear)
  (endwin)
  (unless (zero? code)
          (fprintf (current-error-port) message)
          (exit code)) ; quit with an error
  (print message)
  (exit))

;;;;
