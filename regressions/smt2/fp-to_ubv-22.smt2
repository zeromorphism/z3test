
; Copyright (c) 2015 Microsoft Corporation
(set-info :status unsat)
(set-info :source "Handcrafted by C.M. Wintersteiger")

(assert (not (= #xFF ((_ fp.to_ubv 8) RTP (fp #b0 #b10110 #b1111110010))))) ; 254.25 RTP = 255 = xFF

(check-sat)
(exit)
