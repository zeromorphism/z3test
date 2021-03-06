;; Copyright (c) 2015 Microsoft Corporation

(set-info :status sat)
(set-info :source "Handcrafted by C.M. Wintersteiger")
(set-option :rewriter.hi_fp_unspecified true)

; X = 2^8 = 256 -> (_ fp.to_ubv_unspecified 8); #x00 is the "hardware interpretation"

(declare-const X (_ FloatingPoint 5 11))
(assert (= X (fp #b0 #b10111 #b0000000000)))

(declare-const B (_ BitVec 8))
(assert (= B ((_ fp.to_ubv 8) RTP X))) 

(assert (= B #x00))

(check-sat)
(check-sat-using smt)
(exit)
