(declare (unit rfc-const))

;;;; Herein lie global variables and constants and record definitions
(module rfc-const *
  (import scheme)
  (import (chicken base))

;;;; Global variables to be changed
  (define items '())
  (define item-count #f)
  (define robot #f)
  (define chicken #f)

;;; Default layout (numpad)
  (define layout
    '((up-char    . #\8)
      (down-char  . #\2)
      (left-char  . #\4)
      (right-char . #\6)
      (up-left-char    . #\7)
      (up-right-char   . #\9)
      (down-left-char  . #\1)
      (down-right-char . #\3)))
  

;;;; Constant values
  (define *frame-colour*   1)
  (define *decor-colour*   2)
  (define *chicken-colour* 3)
  (define *message-colour* 4)
  (define *help-colour*    5)
  (define *control-colour* 6)
  (define *extra-colour*   7)
  (define *robot-colour*   8)

  (define messages
    '("A +0 uncursed cockatrice corpse."
      "A 3D model of a bunny containing 69451 polygons. You do not feel like verifying that claim."
      "A B+ tree in full bloom."
      "A LART made from depleted uranium."
      "A bottle of a soft drink. Warm and flat."
      "A cheque from Donald Knuth, for one hexadecimal dollar."
      "A defiled altar formerly dedicated to the god of IT security."
      "A deserted coop."
      "A fake Amulet of Yendor."
      "A finite state machine. It appears to have stopped. Problematic."
      "A fork that once belonged to one of the dining philosophers."
      "A gift-wrapped set of straightedge and compasses."
      "A handheld electronic console 'Game of Life'. Glidey!"
      "A picture of a woman wearing a hat with feathers. Compression artifacts distorted her face but she looks familiar."
      "A pocket sized copy of the Chine Nual. It's thicker than it's long."
      "A potted plant of dubious legality. It needs watering."
      "A semi-automatic, conservatory key system oboe."
      "A well-worn Slackware 1.0.0 installation floppy set."
      "An ANSI-art picture of a naked man printed with a dot-matrix printer."
      "An ASCII-art picture of a naked person printed with a daisy-wheel printer."
      "An EBCDIC-art picture of a naked woman printed with a line printer."
      "An IO monad. It's pulsating with an ominous energy."
      "An action figure of Guy Steele, 1:18 scale."
      "An electric cdr."
      "An empty set. It's barely visible."
      "An old keyboard. The hyper key seems to be missing."
      "A punched card reader with a USB interface."
      "A barbershop quartet arrangement of the Free Software Song."
      "A pin-up picture of Peter Landin."
      "A pencil sketch of Barbara Liskov."
      "An abstract syntax tree. It needs pruning."
      "An encrypted message from Alice to Bob. You feel dirty intercepting it."
      "Maxwell's daemon. It's complaining about the weather."
      "Do you want your possessions identified? [ynq]"
      "Five tonnes of flax! Or is it hemp?"
      "It's a doorstopper with no door to stop."
      "It's a busy waiting daemon. It looks anxious."
      "One of Paul Graham's oil paintings."
      "There is absolutely nothing here.                       (fnord?)"
      "These are two bodies connected by a weightless string."
      "This is a Canterbury corpus in folio, bound in leather of Stanford bunnies."
      "This is a VAXServer running OpenVMS 8.3."
      "This is a cheap knock-off of the platinum-iridium kilogramme standard."
      "This is a sleeping barber. Don't touch his locks."
      "This is a teapot. You are certain that you've seen it somewhere."
      "This is a maze of twisty passages, all alike."
      "This is almost a chicken, but not quite. Try harder."
      "This is Coq. Don't confuse it with chicken."
      "This is a delimited continuation."
      "This is a plush Beastie. It appears to have misplaced its fork."
      "This is an abstract factory."
      "This is an FPGA reimplementation of the Connection Machine."
      "Why would you want to do that?"
      "You come across a line printer, happily printing away the source of its drivers."
      "You found some slack."
      "You have no idea what it is, but you hope it's not what it looks like."
      "You tripped on a null modem lying around. Ouch!"
      "A spam postcard. It offers you to enlarge your mailbox."
      "EICAR test file written on vellum in gothic script."
      "A bowl of chicken nuggets. You start worrying that your quest is futile."
      "A BSD daemon picture in the ICO format. Quite iconoclastic."
      "Collector's edition of Robot Finds Chicken. Mint condition, unopened."
      "A hatchling hawk. You feel cheated."
      "This is Stalin brutally optimizing an R4RS program."
      "An eggshell mosaic of John McCarthy."
      "A coffee bean sculpture of Rich Hickey."
      "Dijkstra's fountain pen. It's out of ink."
      "A copy of SICP with obscene marginalia."
      "Tail of an empty list."
      "A coupon for one free theorem."
      "QuickBasic implementation of Ada Lovelace's first program."
      "A recording of the sound of one hand clapping. You don't find it enlightening."
      "The definitive guide to avian search and rescue in terminal environments, second edition."
      "This is a faifthul catalogue of the Library of Babel."
      "The demonstration of the fallacy of the true catalogue of the Library of Babel."
      "A chicken decoy. It looked convincing from a distance."
      "A fertilised egg. You can cheat by waiting for it to hatch if you are tired of searching."
      "You stepped on a tarball! Yuck!"))

  (define chars
    '(#\! #\@ #\# #\$ #\% #\& #\*
      #\/ #\= #\? #\+ #\- #\_ #\\
      #\| #\' #\, #\. #\; #\: #\"
      #\< #\> #\` #\~))
  
;;;; Record definitions
  (define-record item
    row col row-prev col-prev
    moved? message colour char)

  (define-record-type item
    (spawn-item item-row item-col
                item-row-prev item-col-prev
                moved item-message
                item-colour item-char)
    item?
    (item-row row row-set!)
    (item-col col col-set!)
    (item-row-prev row-prev row-prev-set!)
    (item-col-prev col-prev col-prev-set!)
    (item-message message message-set!)
    (item-colour colour colour-set!)
    (item-char char char-set!)
    (moved moved? moved!)))
