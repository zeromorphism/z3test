
; Copyright (c) 2015 Microsoft Corporation
(set-info :status sat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(declare-fun X ()  (_ FloatingPoint 11 53))

; -16 = -1p4
(assert (= X ((_ to_fp 11 53) RTZ #xFFFFFFFFFFFFFFF0))) 
(assert (= X (fp #b1 #b10000000011 #x0000000000000)))

(check-sat)
(exit)
