(set-logic QF_UF)
(set-info :source |
CADE ATP System competition. See http://www.cs.miami.edu/~tptp/CASC
 for more information. 

This benchmark was obtained by trying to find a finite model of a first-order 
formula (Albert Oliveras).
|)
(set-info :smt-lib-version 2.0)
(set-info :category "crafted")
(set-info :status unsat)
(declare-sort U 0)
(declare-fun f1 (U U) U)
(declare-fun c2 () U)
(declare-fun c3 () U)
(declare-fun c4 () U)
(declare-fun c_0 () U)
(declare-fun c_1 () U)
(declare-fun c_2 () U)
(declare-fun c_3 () U)
(declare-fun c_4 () U)
(assert (let ((?v_2 (f1 c_0 c_0))) (let ((?v_0 (f1 c_0 ?v_2))) (let ((?v_1 (f1 c_0 ?v_0)) (?v_4 (f1 c_0 c_1)) (?v_5 (f1 c_0 c_2)) (?v_6 (f1 c_0 c_3)) (?v_7 (f1 c_0 c_4)) (?v_14 (f1 c_1 c_1))) (let ((?v_13 (f1 c_0 ?v_14))) (let ((?v_3 (f1 c_0 ?v_13)) (?v_11 (f1 c_1 ?v_2)) (?v_21 (f1 c_2 c_2))) (let ((?v_29 (f1 c_0 ?v_21))) (let ((?v_8 (f1 c_0 ?v_29)) (?v_27 (f1 c_2 ?v_2)) (?v_23 (f1 c_3 c_3))) (let ((?v_43 (f1 c_0 ?v_23))) (let ((?v_9 (f1 c_0 ?v_43)) (?v_41 (f1 c_3 ?v_2)) (?v_25 (f1 c_4 c_4))) (let ((?v_59 (f1 c_0 ?v_25))) (let ((?v_10 (f1 c_0 ?v_59)) (?v_57 (f1 c_4 ?v_2)) (?v_12 (f1 c_1 ?v_11)) (?v_15 (f1 c_1 c_0)) (?v_18 (f1 c_1 c_2)) (?v_19 (f1 c_1 c_3)) (?v_20 (f1 c_1 c_4)) (?v_17 (f1 c_1 ?v_14))) (let ((?v_16 (f1 c_1 ?v_17)) (?v_34 (f1 c_1 ?v_21))) (let ((?v_22 (f1 c_1 ?v_34)) (?v_30 (f1 c_2 ?v_14)) (?v_49 (f1 c_1 ?v_23))) (let ((?v_24 (f1 c_1 ?v_49)) (?v_44 (f1 c_3 ?v_14)) (?v_66 (f1 c_1 ?v_25))) (let ((?v_26 (f1 c_1 ?v_66)) (?v_60 (f1 c_4 ?v_14)) (?v_28 (f1 c_2 ?v_27)) (?v_31 (f1 c_2 c_0)) (?v_33 (f1 c_2 c_1)) (?v_35 (f1 c_2 c_3)) (?v_36 (f1 c_2 c_4)) (?v_32 (f1 c_2 ?v_30)) (?v_38 (f1 c_2 ?v_21))) (let ((?v_37 (f1 c_2 ?v_38)) (?v_53 (f1 c_2 ?v_23))) (let ((?v_39 (f1 c_2 ?v_53)) (?v_51 (f1 c_3 ?v_21)) (?v_69 (f1 c_2 ?v_25))) (let ((?v_40 (f1 c_2 ?v_69)) (?v_67 (f1 c_4 ?v_21)) (?v_42 (f1 c_3 ?v_41)) (?v_45 (f1 c_3 c_0)) (?v_47 (f1 c_3 c_1)) (?v_48 (f1 c_3 c_2)) (?v_50 (f1 c_3 c_4)) (?v_46 (f1 c_3 ?v_44)) (?v_52 (f1 c_3 ?v_51)) (?v_55 (f1 c_3 ?v_23))) (let ((?v_54 (f1 c_3 ?v_55)) (?v_72 (f1 c_3 ?v_25))) (let ((?v_56 (f1 c_3 ?v_72)) (?v_70 (f1 c_4 ?v_23)) (?v_58 (f1 c_4 ?v_57)) (?v_61 (f1 c_4 c_0)) (?v_63 (f1 c_4 c_1)) (?v_64 (f1 c_4 c_2)) (?v_65 (f1 c_4 c_3)) (?v_62 (f1 c_4 ?v_60)) (?v_68 (f1 c_4 ?v_67))) (let ((?v_71 (f1 c_4 ?v_70)) (?v_74 (f1 c_4 ?v_25))) (let ((?v_73 (f1 c_4 ?v_74))) (and (distinct c_0 c_1 c_2 c_3 c_4) (= (f1 ?v_1 ?v_0) c_0) (= (f1 ?v_1 (f1 c_0 ?v_4)) c_0) (= (f1 ?v_1 (f1 c_0 ?v_5)) c_0) (= (f1 ?v_1 (f1 c_0 ?v_6)) c_0) (= (f1 ?v_1 (f1 c_0 ?v_7)) c_0) (= (f1 ?v_3 ?v_11) c_1) (= (f1 ?v_3 (f1 c_1 ?v_4)) c_1) (= (f1 ?v_3 (f1 c_1 ?v_5)) c_1) (= (f1 ?v_3 (f1 c_1 ?v_6)) c_1) (= (f1 ?v_3 (f1 c_1 ?v_7)) c_1) (= (f1 ?v_8 ?v_27) c_2) (= (f1 ?v_8 (f1 c_2 ?v_4)) c_2) (= (f1 ?v_8 (f1 c_2 ?v_5)) c_2) (= (f1 ?v_8 (f1 c_2 ?v_6)) c_2) (= (f1 ?v_8 (f1 c_2 ?v_7)) c_2) (= (f1 ?v_9 ?v_41) c_3) (= (f1 ?v_9 (f1 c_3 ?v_4)) c_3) (= (f1 ?v_9 (f1 c_3 ?v_5)) c_3) (= (f1 ?v_9 (f1 c_3 ?v_6)) c_3) (= (f1 ?v_9 (f1 c_3 ?v_7)) c_3) (= (f1 ?v_10 ?v_57) c_4) (= (f1 ?v_10 (f1 c_4 ?v_4)) c_4) (= (f1 ?v_10 (f1 c_4 ?v_5)) c_4) (= (f1 ?v_10 (f1 c_4 ?v_6)) c_4) (= (f1 ?v_10 (f1 c_4 ?v_7)) c_4) (= (f1 ?v_12 (f1 c_0 ?v_15)) c_0) (= (f1 ?v_12 ?v_13) c_0) (= (f1 ?v_12 (f1 c_0 ?v_18)) c_0) (= (f1 ?v_12 (f1 c_0 ?v_19)) c_0) (= (f1 ?v_12 (f1 c_0 ?v_20)) c_0) (= (f1 ?v_16 (f1 c_1 ?v_15)) c_1) (= (f1 ?v_16 ?v_17) c_1) (= (f1 ?v_16 (f1 c_1 ?v_18)) c_1) (= (f1 ?v_16 (f1 c_1 ?v_19)) c_1) (= (f1 ?v_16 (f1 c_1 ?v_20)) c_1) (= (f1 ?v_22 (f1 c_2 ?v_15)) c_2) (= (f1 ?v_22 ?v_30) c_2) (= (f1 ?v_22 (f1 c_2 ?v_18)) c_2) (= (f1 ?v_22 (f1 c_2 ?v_19)) c_2) (= (f1 ?v_22 (f1 c_2 ?v_20)) c_2) (= (f1 ?v_24 (f1 c_3 ?v_15)) c_3) (= (f1 ?v_24 ?v_44) c_3) (= (f1 ?v_24 (f1 c_3 ?v_18)) c_3) (= (f1 ?v_24 (f1 c_3 ?v_19)) c_3) (= (f1 ?v_24 (f1 c_3 ?v_20)) c_3) (= (f1 ?v_26 (f1 c_4 ?v_15)) c_4) (= (f1 ?v_26 ?v_60) c_4) (= (f1 ?v_26 (f1 c_4 ?v_18)) c_4) (= (f1 ?v_26 (f1 c_4 ?v_19)) c_4) (= (f1 ?v_26 (f1 c_4 ?v_20)) c_4) (= (f1 ?v_28 (f1 c_0 ?v_31)) c_0) (= (f1 ?v_28 (f1 c_0 ?v_33)) c_0) (= (f1 ?v_28 ?v_29) c_0) (= (f1 ?v_28 (f1 c_0 ?v_35)) c_0) (= (f1 ?v_28 (f1 c_0 ?v_36)) c_0) (= (f1 ?v_32 (f1 c_1 ?v_31)) c_1) (= (f1 ?v_32 (f1 c_1 ?v_33)) c_1) (= (f1 ?v_32 ?v_34) c_1) (= (f1 ?v_32 (f1 c_1 ?v_35)) c_1) (= (f1 ?v_32 (f1 c_1 ?v_36)) c_1) (= (f1 ?v_37 (f1 c_2 ?v_31)) c_2) (= (f1 ?v_37 (f1 c_2 ?v_33)) c_2) (= (f1 ?v_37 ?v_38) c_2) (= (f1 ?v_37 (f1 c_2 ?v_35)) c_2) (= (f1 ?v_37 (f1 c_2 ?v_36)) c_2) (= (f1 ?v_39 (f1 c_3 ?v_31)) c_3) (= (f1 ?v_39 (f1 c_3 ?v_33)) c_3) (= (f1 ?v_39 ?v_51) c_3) (= (f1 ?v_39 (f1 c_3 ?v_35)) c_3) (= (f1 ?v_39 (f1 c_3 ?v_36)) c_3) (= (f1 ?v_40 (f1 c_4 ?v_31)) c_4) (= (f1 ?v_40 (f1 c_4 ?v_33)) c_4) (= (f1 ?v_40 ?v_67) c_4) (= (f1 ?v_40 (f1 c_4 ?v_35)) c_4) (= (f1 ?v_40 (f1 c_4 ?v_36)) c_4) (= (f1 ?v_42 (f1 c_0 ?v_45)) c_0) (= (f1 ?v_42 (f1 c_0 ?v_47)) c_0) (= (f1 ?v_42 (f1 c_0 ?v_48)) c_0) (= (f1 ?v_42 ?v_43) c_0) (= (f1 ?v_42 (f1 c_0 ?v_50)) c_0) (= (f1 ?v_46 (f1 c_1 ?v_45)) c_1) (= (f1 ?v_46 (f1 c_1 ?v_47)) c_1) (= (f1 ?v_46 (f1 c_1 ?v_48)) c_1) (= (f1 ?v_46 ?v_49) c_1) (= (f1 ?v_46 (f1 c_1 ?v_50)) c_1) (= (f1 ?v_52 (f1 c_2 ?v_45)) c_2) (= (f1 ?v_52 (f1 c_2 ?v_47)) c_2) (= (f1 ?v_52 (f1 c_2 ?v_48)) c_2) (= (f1 ?v_52 ?v_53) c_2) (= (f1 ?v_52 (f1 c_2 ?v_50)) c_2) (= (f1 ?v_54 (f1 c_3 ?v_45)) c_3) (= (f1 ?v_54 (f1 c_3 ?v_47)) c_3) (= (f1 ?v_54 (f1 c_3 ?v_48)) c_3) (= (f1 ?v_54 ?v_55) c_3) (= (f1 ?v_54 (f1 c_3 ?v_50)) c_3) (= (f1 ?v_56 (f1 c_4 ?v_45)) c_4) (= (f1 ?v_56 (f1 c_4 ?v_47)) c_4) (= (f1 ?v_56 (f1 c_4 ?v_48)) c_4) (= (f1 ?v_56 ?v_70) c_4) (= (f1 ?v_56 (f1 c_4 ?v_50)) c_4) (= (f1 ?v_58 (f1 c_0 ?v_61)) c_0) (= (f1 ?v_58 (f1 c_0 ?v_63)) c_0) (= (f1 ?v_58 (f1 c_0 ?v_64)) c_0) (= (f1 ?v_58 (f1 c_0 ?v_65)) c_0) (= (f1 ?v_58 ?v_59) c_0) (= (f1 ?v_62 (f1 c_1 ?v_61)) c_1) (= (f1 ?v_62 (f1 c_1 ?v_63)) c_1) (= (f1 ?v_62 (f1 c_1 ?v_64)) c_1) (= (f1 ?v_62 (f1 c_1 ?v_65)) c_1) (= (f1 ?v_62 ?v_66) c_1) (= (f1 ?v_68 (f1 c_2 ?v_61)) c_2) (= (f1 ?v_68 (f1 c_2 ?v_63)) c_2) (= (f1 ?v_68 (f1 c_2 ?v_64)) c_2) (= (f1 ?v_68 (f1 c_2 ?v_65)) c_2) (= (f1 ?v_68 ?v_69) c_2) (= (f1 ?v_71 (f1 c_3 ?v_61)) c_3) (= (f1 ?v_71 (f1 c_3 ?v_63)) c_3) (= (f1 ?v_71 (f1 c_3 ?v_64)) c_3) (= (f1 ?v_71 (f1 c_3 ?v_65)) c_3) (= (f1 ?v_71 ?v_72) c_3) (= (f1 ?v_73 (f1 c_4 ?v_61)) c_4) (= (f1 ?v_73 (f1 c_4 ?v_63)) c_4) (= (f1 ?v_73 (f1 c_4 ?v_64)) c_4) (= (f1 ?v_73 (f1 c_4 ?v_65)) c_4) (= (f1 ?v_73 ?v_74) c_4) (or (not (= (f1 (f1 c2 c2) (f1 c3 c2)) c2)) (not (= (f1 c2 (f1 c3 (f1 c2 c4))) (f1 (f1 (f1 c4 c3) c3) c2)))) (or (= ?v_2 c_0) (= ?v_2 c_1) (= ?v_2 c_2) (= ?v_2 c_3) (= ?v_2 c_4)) (or (= ?v_4 c_0) (= ?v_4 c_1) (= ?v_4 c_2) (= ?v_4 c_3) (= ?v_4 c_4)) (or (= ?v_5 c_0) (= ?v_5 c_1) (= ?v_5 c_2) (= ?v_5 c_3) (= ?v_5 c_4)) (or (= ?v_6 c_0) (= ?v_6 c_1) (= ?v_6 c_2) (= ?v_6 c_3) (= ?v_6 c_4)) (or (= ?v_7 c_0) (= ?v_7 c_1) (= ?v_7 c_2) (= ?v_7 c_3) (= ?v_7 c_4)) (or (= ?v_15 c_0) (= ?v_15 c_1) (= ?v_15 c_2) (= ?v_15 c_3) (= ?v_15 c_4)) (or (= ?v_14 c_0) (= ?v_14 c_1) (= ?v_14 c_2) (= ?v_14 c_3) (= ?v_14 c_4)) (or (= ?v_18 c_0) (= ?v_18 c_1) (= ?v_18 c_2) (= ?v_18 c_3) (= ?v_18 c_4)) (or (= ?v_19 c_0) (= ?v_19 c_1) (= ?v_19 c_2) (= ?v_19 c_3) (= ?v_19 c_4)) (or (= ?v_20 c_0) (= ?v_20 c_1) (= ?v_20 c_2) (= ?v_20 c_3) (= ?v_20 c_4)) (or (= ?v_31 c_0) (= ?v_31 c_1) (= ?v_31 c_2) (= ?v_31 c_3) (= ?v_31 c_4)) (or (= ?v_33 c_0) (= ?v_33 c_1) (= ?v_33 c_2) (= ?v_33 c_3) (= ?v_33 c_4)) (or (= ?v_21 c_0) (= ?v_21 c_1) (= ?v_21 c_2) (= ?v_21 c_3) (= ?v_21 c_4)) (or (= ?v_35 c_0) (= ?v_35 c_1) (= ?v_35 c_2) (= ?v_35 c_3) (= ?v_35 c_4)) (or (= ?v_36 c_0) (= ?v_36 c_1) (= ?v_36 c_2) (= ?v_36 c_3) (= ?v_36 c_4)) (or (= ?v_45 c_0) (= ?v_45 c_1) (= ?v_45 c_2) (= ?v_45 c_3) (= ?v_45 c_4)) (or (= ?v_47 c_0) (= ?v_47 c_1) (= ?v_47 c_2) (= ?v_47 c_3) (= ?v_47 c_4)) (or (= ?v_48 c_0) (= ?v_48 c_1) (= ?v_48 c_2) (= ?v_48 c_3) (= ?v_48 c_4)) (or (= ?v_23 c_0) (= ?v_23 c_1) (= ?v_23 c_2) (= ?v_23 c_3) (= ?v_23 c_4)) (or (= ?v_50 c_0) (= ?v_50 c_1) (= ?v_50 c_2) (= ?v_50 c_3) (= ?v_50 c_4)) (or (= ?v_61 c_0) (= ?v_61 c_1) (= ?v_61 c_2) (= ?v_61 c_3) (= ?v_61 c_4)) (or (= ?v_63 c_0) (= ?v_63 c_1) (= ?v_63 c_2) (= ?v_63 c_3) (= ?v_63 c_4)) (or (= ?v_64 c_0) (= ?v_64 c_1) (= ?v_64 c_2) (= ?v_64 c_3) (= ?v_64 c_4)) (or (= ?v_65 c_0) (= ?v_65 c_1) (= ?v_65 c_2) (= ?v_65 c_3) (= ?v_65 c_4)) (or (= ?v_25 c_0) (= ?v_25 c_1) (= ?v_25 c_2) (= ?v_25 c_3) (= ?v_25 c_4)) (or (= c2 c_0) (= c2 c_1) (= c2 c_2) (= c2 c_3) (= c2 c_4)) (or (= c3 c_0) (= c3 c_1) (= c3 c_2) (= c3 c_3) (= c3 c_4)) (or (= c4 c_0) (= c4 c_1) (= c4 c_2) (= c4 c_3) (= c4 c_4))))))))))))))))))))))))))
(check-sat)
(exit)