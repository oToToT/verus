(set-option :auto_config false)
(set-option :smt.case_split 3)
(set-option :smt.qi.eager_threshold 100.0)
(set-option :smt.delay_units true)
(set-option :smt.arith.solver 2)
(set-option :smt.arith.nl false)
(set-option :smt.macro_finder true)
(set-option :smt.mbqi true)

;; AIR prelude
(declare-sort %%Function%% 0)

(declare-sort Poly 0)
(declare-fun B (Bool) Poly)
(declare-fun %B (Poly) Bool)
(declare-sort Type 0)
(declare-const BOOL Type)
(declare-sort Dcr 0)
(declare-const $ Dcr)
(declare-fun REF (Dcr) Dcr)
(declare-fun has_type (Poly Type) Bool)
(assert
 (forall ((b Bool)) (!
   (has_type (B b) BOOL)
   :pattern ((has_type (B b) BOOL))
   :qid prelude_has_type_bool
   :skolemid skolem_prelude_has_type_bool
)))
(assert
 (forall ((x Bool)) (!
   (= x (%B (B x)))
   :pattern ((B x))
   :qid prelude_unbox_box_bool
   :skolemid skolem_prelude_unbox_box_bool
)))
(assert
 (forall ((x Poly)) (!
   (=>
    (has_type x BOOL)
    (= x (B (%B x)))
   )
   :pattern ((has_type x BOOL))
   :qid prelude_box_unbox_bool
   :skolemid skolem_prelude_box_unbox_bool
)))
(declare-fun TYPE%delmap_epr!EPRModel.SOMapModel. (Dcr Type Dcr Type) Type)
(declare-fun TYPE%delmap_epr!EPRModel.DMapModel. (Dcr Type Dcr Type) Type)
(declare-fun delmap_epr!EPRModel.impl&%0.m.? (Dcr Type Dcr Type Poly Poly Poly) Bool)
(declare-fun delmap_epr!EPRModel.impl&%0.gap.? (Dcr Type Dcr Type Poly Poly Poly)
 Bool
)
(declare-fun delmap_epr!EPRModel.impl&%0.erase.? (Dcr Type Dcr Type Poly Poly Poly
  Poly
 ) Bool
)
(declare-fun delmap_epr!EPRModel.impl&%0.erase_unbounded.? (Dcr Type Dcr Type Poly
  Poly Poly
 ) Bool
)
(declare-fun delmap_epr!EPRModel.impl&%0.set.? (Dcr Type Dcr Type Poly Poly Poly Poly)
 Bool
)
(declare-fun delmap_epr!EPRModel.impl&%0.contains.? (Dcr Type Dcr Type Poly Poly)
 Bool
)
(declare-fun delmap_epr!EPRModel.impl&%0.g_l_b.? (Dcr Type Dcr Type Poly Poly Poly)
 Bool
)
(declare-fun delmap_epr!EPRModel.impl&%1.m.? (Dcr Type Dcr Type Poly Poly Poly) Bool)
(declare-fun delmap_epr!EPRModel.impl&%1.lows.? (Dcr Type Dcr Type Poly) Poly)
(declare-fun delmap_epr!EPRModel.impl&%1.new.? (Dcr Type Dcr Type Poly Poly) Bool)
(declare-fun delmap_epr!EPRModel.impl&%1.get.? (Dcr Type Dcr Type Poly Poly Poly)
 Bool
)
(declare-fun delmap_epr!EPRModel.impl&%1.get_internal.? (Dcr Type Dcr Type Poly Poly
  Poly Poly
 ) Bool
)
(declare-fun delmap_epr!EPRModel.impl&%1.set.? (Dcr Type Dcr Type Poly Poly Poly Poly
  Poly Poly Poly Poly Poly
 ) Bool
)
(declare-fun delmap_epr!EPRModel.impl&%1.set_unbounded.? (Dcr Type Dcr Type Poly Poly
  Poly Poly Poly
 ) Bool
)
(declare-fun delmap_epr!EPRModel.key_zero.? (Dcr Type) Poly)
(declare-fun delmap_epr!EPRModel.key_le.? (Dcr Type Poly Poly) Bool)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (self~2@ Poly)) (!
   (=>
    (has_type self~2@ (TYPE%delmap_epr!EPRModel.DMapModel. K&. K& ID&. ID&))
    (has_type (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& self~2@) (TYPE%delmap_epr!EPRModel.SOMapModel.
      K&. K& ID&. ID&
   )))
   :pattern ((delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& self~2@))
   :qid internal_delmap_epr!EPRModel.impl&__1.lows.?_pre_post_definition
   :skolemid skolem_internal_delmap_epr!EPRModel.impl&__1.lows.?_pre_post_definition
)))
(assert
 (forall ((K&. Dcr) (K& Type)) (!
   (has_type (delmap_epr!EPRModel.key_zero.? K&. K&) K&)
   :pattern ((delmap_epr!EPRModel.key_zero.? K&. K&))
   :qid internal_delmap_epr!EPRModel.key_zero.?_pre_post_definition
   :skolemid skolem_internal_delmap_epr!EPRModel.key_zero.?_pre_post_definition
)))
(declare-fun ens%delmap_epr!EPRModel.impl&%0.map_properties. (Dcr Type Dcr Type Poly)
 Bool
)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (self~2@ Poly)) (!
   (= (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& self~2@) (forall
     ((k~16$ Poly) (id_1~18$ Poly) (id_2~20$ Poly)) (!
      (=>
       (and
        (has_type k~16$ K&)
        (has_type id_1~18$ ID&)
        (has_type id_2~20$ ID&)
       )
       (=>
        (and
         (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& self~2@ k~16$ id_1~18$)
         (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& self~2@ k~16$ id_2~20$)
        )
        (= id_1~18$ id_2~20$)
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& self~2@ k~16$ id_1~18$)
       (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& self~2@ k~16$ id_2~20$)
      )
      :qid !!disabled!!user_delmap_epr__EPRModel__SOMapModel__map_properties_0
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__SOMapModel__map_properties_0
   )))
   :pattern ((ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& self~2@))
   :qid !!disabled!!internal_ens__delmap_epr!EPRModel.impl&__0.map_properties._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRModel.impl&__0.map_properties._definition
)))
(declare-fun ens%delmap_epr!EPRModel.impl&%0.gap_properties. (Dcr Type Dcr Type Poly)
 Bool
)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (self~2@ Poly)) (!
   (= (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& self~2@) (and
     (forall ((w~16$ Poly) (x~18$ Poly) (y~20$ Poly) (z~22$ Poly)) (!
       (=>
        (and
         (has_type w~16$ K&)
         (has_type x~18$ K&)
         (has_type y~20$ K&)
         (has_type z~22$ K&)
        )
        (=>
         (and
          (and
           (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ w~16$ x~18$)
           (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ y~20$ z~22$)
          )
          (not (delmap_epr!EPRModel.key_le.? K&. K& x~18$ y~20$))
         )
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ w~16$ z~22$)
       ))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ w~16$ x~18$)
        (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ y~20$ z~22$)
       )
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& x~18$ y~20$) (delmap_epr!EPRModel.impl&%0.gap.?
         K&. K& ID&. ID& self~2@ w~16$ z~22$
       ))
       :qid !!disabled!!user_delmap_epr__EPRModel__SOMapModel__gap_properties_1
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__SOMapModel__gap_properties_1
     ))
     (forall ((w~126$ Poly) (x~128$ Poly) (y~130$ Poly) (z~132$ Poly)) (!
       (=>
        (and
         (has_type w~126$ K&)
         (has_type x~128$ K&)
         (has_type y~130$ K&)
         (has_type z~132$ K&)
        )
        (=>
         (and
          (and
           (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ w~126$ x~128$)
           (delmap_epr!EPRModel.key_le.? K&. K& w~126$ y~130$)
          )
          (delmap_epr!EPRModel.key_le.? K&. K& z~132$ x~128$)
         )
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ y~130$ z~132$)
       ))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ w~126$ x~128$)
        (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ y~130$ z~132$)
       )
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& w~126$ y~130$) (delmap_epr!EPRModel.key_le.?
         K&. K& z~132$ x~128$
       ))
       :qid !!disabled!!user_delmap_epr__EPRModel__SOMapModel__gap_properties_4
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__SOMapModel__gap_properties_4
     ))
     (forall ((l~181$ Poly) (k~183$ Poly) (m~185$ Poly) (id~187$ Poly)) (!
       (=>
        (and
         (has_type l~181$ K&)
         (has_type k~183$ K&)
         (has_type m~185$ K&)
         (has_type id~187$ ID&)
        )
        (=>
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ k~183$ m~185$)
         (not (and
           (and
            (not (delmap_epr!EPRModel.key_le.? K&. K& l~181$ k~183$))
            (not (delmap_epr!EPRModel.key_le.? K&. K& m~185$ l~181$))
           )
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& self~2@ l~181$ id~187$)
       ))))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& self~2@ k~183$ m~185$)
        (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& self~2@ l~181$ id~187$)
       )
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& l~181$ k~183$) (delmap_epr!EPRModel.key_le.?
         K&. K& m~185$ l~181$
        ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& self~2@ l~181$ id~187$)
       )
       :qid !!disabled!!user_delmap_epr__EPRModel__SOMapModel__gap_properties_5
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__SOMapModel__gap_properties_5
   ))))
   :pattern ((ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& self~2@))
   :qid !!disabled!!internal_ens__delmap_epr!EPRModel.impl&__0.gap_properties._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRModel.impl&__0.gap_properties._definition
)))
(declare-fun ens%delmap_epr!EPRModel.impl&%1.map_properties. (Dcr Type Dcr Type Poly)
 Bool
)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (self~2@ Poly)) (!
   (= (ens%delmap_epr!EPRModel.impl&%1.map_properties. K&. K& ID&. ID& self~2@) (forall
     ((k~16$ Poly) (id_1~18$ Poly) (id_2~20$ Poly)) (!
      (=>
       (and
        (has_type k~16$ K&)
        (has_type id_1~18$ ID&)
        (has_type id_2~20$ ID&)
       )
       (=>
        (and
         (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& self~2@ k~16$ id_1~18$)
         (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& self~2@ k~16$ id_2~20$)
        )
        (= id_1~18$ id_2~20$)
      ))
      :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& self~2@ k~16$ id_1~18$)
       (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& self~2@ k~16$ id_2~20$)
      )
      :qid !!disabled!!user_delmap_epr__EPRModel__DMapModel__map_properties_6
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__DMapModel__map_properties_6
   )))
   :pattern ((ens%delmap_epr!EPRModel.impl&%1.map_properties. K&. K& ID&. ID& self~2@))
   :qid !!disabled!!internal_ens__delmap_epr!EPRModel.impl&__1.map_properties._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRModel.impl&__1.map_properties._definition
)))
(declare-fun ens%delmap_epr!EPRModel.key_le_properties. (Dcr Type) Bool)
(assert
 (forall ((K&. Dcr) (K& Type)) (!
   (= (ens%delmap_epr!EPRModel.key_le_properties. K&. K&) (and
     (forall ((x~14$ Poly)) (!
       (=>
        (has_type x~14$ K&)
        (delmap_epr!EPRModel.key_le.? K&. K& (delmap_epr!EPRModel.key_zero.? K&. K&) x~14$)
       )
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& (delmap_epr!EPRModel.key_zero.? K&. K&)
         x~14$
       ))
       :qid !!disabled!!user_delmap_epr__EPRModel__key_le_properties_7
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__key_le_properties_7
     ))
     (forall ((x~32$ Poly)) (!
       (=>
        (has_type x~32$ K&)
        (delmap_epr!EPRModel.key_le.? K&. K& x~32$ x~32$)
       )
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& x~32$ x~32$))
       :qid !!disabled!!user_delmap_epr__EPRModel__key_le_properties_8
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__key_le_properties_8
     ))
     (forall ((x~49$ Poly) (y~51$ Poly) (z~53$ Poly)) (!
       (=>
        (and
         (has_type x~49$ K&)
         (has_type y~51$ K&)
         (has_type z~53$ K&)
        )
        (=>
         (and
          (delmap_epr!EPRModel.key_le.? K&. K& x~49$ y~51$)
          (delmap_epr!EPRModel.key_le.? K&. K& y~51$ z~53$)
         )
         (delmap_epr!EPRModel.key_le.? K&. K& x~49$ z~53$)
       ))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& x~49$ y~51$) (delmap_epr!EPRModel.key_le.?
         K&. K& y~51$ z~53$
       ))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& x~49$ y~51$) (delmap_epr!EPRModel.key_le.?
         K&. K& x~49$ z~53$
       ))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& y~51$ z~53$) (delmap_epr!EPRModel.key_le.?
         K&. K& x~49$ z~53$
       ))
       :qid !!disabled!!user_delmap_epr__EPRModel__key_le_properties_9
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__key_le_properties_9
     ))
     (forall ((x~94$ Poly) (y~96$ Poly)) (!
       (=>
        (and
         (has_type x~94$ K&)
         (has_type y~96$ K&)
        )
        (=>
         (and
          (delmap_epr!EPRModel.key_le.? K&. K& x~94$ y~96$)
          (delmap_epr!EPRModel.key_le.? K&. K& y~96$ x~94$)
         )
         (= x~94$ y~96$)
       ))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& x~94$ y~96$))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& y~96$ x~94$))
       :qid !!disabled!!user_delmap_epr__EPRModel__key_le_properties_10
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__key_le_properties_10
     ))
     (forall ((x~137$ Poly) (y~139$ Poly)) (!
       (=>
        (and
         (has_type x~137$ K&)
         (has_type y~139$ K&)
        )
        (or
         (delmap_epr!EPRModel.key_le.? K&. K& x~137$ y~139$)
         (delmap_epr!EPRModel.key_le.? K&. K& y~139$ x~137$)
       ))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& x~137$ y~139$))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& y~139$ x~137$))
       :qid !!disabled!!user_delmap_epr__EPRModel__key_le_properties_11
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRModel__key_le_properties_11
   ))))
   :pattern ((ens%delmap_epr!EPRModel.key_le_properties. K&. K&))
   :qid !!disabled!!internal_ens__delmap_epr!EPRModel.key_le_properties._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRModel.key_le_properties._definition
)))
(declare-fun req%delmap_epr!EPRProof.get_postcondition. (Dcr Type Dcr Type Poly Poly
  Poly
 ) Bool
)
(declare-const %%global_location_label%%0 Bool)
(declare-const %%global_location_label%%1 Bool)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (k~4@ Poly) (id~6@ Poly))
  (!
   (= (req%delmap_epr!EPRProof.get_postcondition. K&. K& ID&. ID& dm~2@ k~4@ id~6@) (
     and
     (=>
      %%global_location_label%%0
      (and
       (and
        (and
         (exists ((id~13$ Poly)) (!
           (and
            (has_type id~13$ ID&)
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
           ))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
           ))
           :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_12
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_12
         ))
         (forall ((k~34$ Poly)) (!
           (=>
            (has_type k~34$ K&)
            (exists ((id~42$ Poly)) (!
              (and
               (has_type id~42$ ID&)
               (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
              )
              :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_13
              :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_13
           )))
           :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_14
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_14
        )))
        (forall ((k~60$ Poly) (id~62$ Poly)) (!
          (=>
           (and
            (has_type k~60$ K&)
            (has_type id~62$ ID&)
           )
           (=>
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) k~60$ id~62$
            )
            (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) k~60$ id~62$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
          :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_15
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_15
       )))
       (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
         (=>
          (and
           (has_type i~95$ K&)
           (has_type j~97$ K&)
           (has_type id_1~99$ ID&)
           (has_type id_2~101$ ID&)
          )
          (=>
           (and
            (and
             (and
              (and
               (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
               (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) i~95$ id_1~99$
              ))
              (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
             )
             (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
               K&. K& ID&. ID& dm~2@
              ) i~95$ j~97$
            ))
            (not (= id_1~99$ id_2~101$))
           )
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) j~97$ id_2~101$
         )))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) i~95$ id_1~99$
          ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
         )
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) i~95$ id_1~99$
          ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) j~97$ id_2~101$
         ))
         :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_16
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_16
     ))))
     (=>
      %%global_location_label%%1
      (exists ((glb~14$ Poly)) (!
        (and
         (has_type glb~14$ K&)
         (and
          (and
           (and
            (and
             (delmap_epr!EPRModel.key_le.? K&. K& glb~14$ k~4@)
             (exists ((id~24$ Poly)) (!
               (and
                (has_type id~24$ ID&)
                (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                  K&. K& ID&. ID& dm~2@
                 ) glb~14$ id~24$
               ))
               :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                  K&. K& ID&. ID& dm~2@
                 ) glb~14$ id~24$
               ))
               :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_17
               :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_17
            )))
            (=>
             (exists ((id~46$ Poly)) (!
               (and
                (has_type id~46$ ID&)
                (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                  K&. K& ID&. ID& dm~2@
                 ) k~4@ id~46$
               ))
               :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                  K&. K& ID&. ID& dm~2@
                 ) k~4@ id~46$
               ))
               :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_18
               :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_18
             ))
             (= glb~14$ k~4@)
           ))
           (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) glb~14$ k~4@
          ))
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) glb~14$ id~6@
        )))
        :pattern ((delmap_epr!EPRModel.key_le.? K&. K& glb~14$ k~4@))
        :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) glb~14$ k~4@
        ))
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) glb~14$ id~6@
        ))
        :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_19
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_19
   )))))
   :pattern ((req%delmap_epr!EPRProof.get_postcondition. K&. K& ID&. ID& dm~2@ k~4@ id~6@))
   :qid !!disabled!!internal_req__delmap_epr!EPRProof.get_postcondition._definition
   :skolemid skolem_!!disabled!!internal_req__delmap_epr!EPRProof.get_postcondition._definition
)))
(declare-fun ens%delmap_epr!EPRProof.get_postcondition. (Dcr Type Dcr Type Poly Poly
  Poly
 ) Bool
)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (k~4@ Poly) (id~6@ Poly))
  (!
   (= (ens%delmap_epr!EPRProof.get_postcondition. K&. K& ID&. ID& dm~2@ k~4@ id~6@) (
     delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~4@ id~6@
   ))
   :pattern ((ens%delmap_epr!EPRProof.get_postcondition. K&. K& ID&. ID& dm~2@ k~4@ id~6@))
   :qid !!disabled!!internal_ens__delmap_epr!EPRProof.get_postcondition._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRProof.get_postcondition._definition
)))
(push)
 (declare-const K&. Dcr)
 (declare-const K& Type)
 (declare-const ID&. Dcr)
 (declare-const ID& Type)
 (declare-const dm~2@ Poly)
 (declare-const k~4@ Poly)
 (declare-const id~6@ Poly)
 (declare-const tmp%1@ Poly)
 (declare-const tmp%2@ Poly)
 (assert
  (has_type dm~2@ (TYPE%delmap_epr!EPRModel.DMapModel. K&. K& ID&. ID&))
 )
 (assert
  (has_type k~4@ K&)
 )
 (assert
  (has_type id~6@ ID&)
 )
 (assert
  (and
   (and
    (and
     (exists ((id~13$ Poly)) (!
       (and
        (has_type id~13$ ID&)
        (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
       ))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
       ))
       :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_20
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_20
     ))
     (forall ((k~34$ Poly)) (!
       (=>
        (has_type k~34$ K&)
        (exists ((id~42$ Poly)) (!
          (and
           (has_type id~42$ ID&)
           (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
          )
          :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_21
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_21
       )))
       :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_22
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_22
    )))
    (forall ((k~60$ Poly) (id~62$ Poly)) (!
      (=>
       (and
        (has_type k~60$ K&)
        (has_type id~62$ ID&)
       )
       (=>
        (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) k~60$ id~62$
        )
        (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) k~60$ id~62$
      ))
      :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
      :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_23
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_23
   )))
   (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
     (=>
      (and
       (has_type i~95$ K&)
       (has_type j~97$ K&)
       (has_type id_1~99$ ID&)
       (has_type id_2~101$ ID&)
      )
      (=>
       (and
        (and
         (and
          (and
           (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) i~95$ id_1~99$
          ))
          (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
         )
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) i~95$ j~97$
        ))
        (not (= id_1~99$ id_2~101$))
       )
       (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) j~97$ id_2~101$
     )))
     :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) i~95$ id_1~99$
      ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
     )
     :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) i~95$ id_1~99$
      ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) j~97$ id_2~101$
     ))
     :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_24
     :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_24
 ))))
 (assert
  (exists ((glb~14$ Poly)) (!
    (and
     (has_type glb~14$ K&)
     (and
      (and
       (and
        (and
         (delmap_epr!EPRModel.key_le.? K&. K& glb~14$ k~4@)
         (exists ((id~24$ Poly)) (!
           (and
            (has_type id~24$ ID&)
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) glb~14$ id~24$
           ))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) glb~14$ id~24$
           ))
           :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_25
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_25
        )))
        (=>
         (exists ((id~46$ Poly)) (!
           (and
            (has_type id~46$ ID&)
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) k~4@ id~46$
           ))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) k~4@ id~46$
           ))
           :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_26
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_26
         ))
         (= glb~14$ k~4@)
       ))
       (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) glb~14$ k~4@
      ))
      (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) glb~14$ id~6@
    )))
    :pattern ((delmap_epr!EPRModel.key_le.? K&. K& glb~14$ k~4@))
    :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
       K&. K& ID&. ID& dm~2@
      ) glb~14$ k~4@
    ))
    :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
       K&. K& ID&. ID& dm~2@
      ) glb~14$ id~6@
    ))
    :qid !!disabled!!user_delmap_epr__EPRProof__get_postcondition_27
    :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__get_postcondition_27
 )))
 ;; postcondition not satisfied
 (declare-const %%location_label%%0 Bool)
 (declare-const %%query%% Bool)
 (assert
  (=>
   %%query%%
   (not (=>
     (ens%delmap_epr!EPRModel.key_le_properties. K&. K&)
     (=>
      (= tmp%1@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm~2@))
      (=>
       (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& tmp%1@)
       (=>
        (= tmp%2@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm~2@))
        (=>
         (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& tmp%2@)
         (=>
          (ens%delmap_epr!EPRModel.impl&%1.map_properties. K&. K& ID&. ID& dm~2@)
          (=>
           %%location_label%%0
           (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~4@ id~6@)
 ))))))))))
 (get-info :version)
 (assert
  %%query%%
 )
 (set-option :rlimit 0)
 (check-sat)
 (set-option :rlimit 0)
(pop)
(declare-fun req%delmap_epr!EPRProof.new_preserves_inv. (Dcr Type Dcr Type Poly Poly)
 Bool
)
(declare-const %%global_location_label%%2 Bool)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (id_zero~4@ Poly))
  (!
   (= (req%delmap_epr!EPRProof.new_preserves_inv. K&. K& ID&. ID& dm~2@ id_zero~4@) (
     =>
     %%global_location_label%%2
     (and
      (and
       (forall ((k~14$ Poly) (id~16$ Poly)) (!
         (=>
          (and
           (has_type k~14$ K&)
           (has_type id~16$ ID&)
          )
          (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~14$ id~16$) (= id~16$ id_zero~4@))
         )
         :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~14$ id~16$))
         :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_28
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_28
       ))
       (forall ((k~48$ Poly) (id~50$ Poly)) (!
         (=>
          (and
           (has_type k~48$ K&)
           (has_type id~50$ ID&)
          )
          (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) k~48$ id~50$
           ) (and
            (= k~48$ (delmap_epr!EPRModel.key_zero.? K&. K&))
            (= id~50$ id_zero~4@)
         )))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) k~48$ id~50$
         ))
         :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_29
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_29
      )))
      (forall ((k~97$ Poly) (j~99$ Poly)) (!
        (=>
         (and
          (has_type k~97$ K&)
          (has_type j~99$ K&)
         )
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) k~97$ j~99$
        ))
        :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) k~97$ j~99$
        ))
        :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_30
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_30
   )))))
   :pattern ((req%delmap_epr!EPRProof.new_preserves_inv. K&. K& ID&. ID& dm~2@ id_zero~4@))
   :qid !!disabled!!internal_req__delmap_epr!EPRProof.new_preserves_inv._definition
   :skolemid skolem_!!disabled!!internal_req__delmap_epr!EPRProof.new_preserves_inv._definition
)))
(declare-fun ens%delmap_epr!EPRProof.new_preserves_inv. (Dcr Type Dcr Type Poly Poly)
 Bool
)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (id_zero~4@ Poly))
  (!
   (= (ens%delmap_epr!EPRProof.new_preserves_inv. K&. K& ID&. ID& dm~2@ id_zero~4@) (
     and
     (and
      (and
       (exists ((id~13$ Poly)) (!
         (and
          (has_type id~13$ ID&)
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
         ))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
         ))
         :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_31
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_31
       ))
       (forall ((k~34$ Poly)) (!
         (=>
          (has_type k~34$ K&)
          (exists ((id~42$ Poly)) (!
            (and
             (has_type id~42$ ID&)
             (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
            )
            :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_32
            :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_32
         )))
         :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_33
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_33
      )))
      (forall ((k~60$ Poly) (id~62$ Poly)) (!
        (=>
         (and
          (has_type k~60$ K&)
          (has_type id~62$ ID&)
         )
         (=>
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) k~60$ id~62$
          )
          (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
        ))
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) k~60$ id~62$
        ))
        :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
        :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_34
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_34
     )))
     (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
       (=>
        (and
         (has_type i~95$ K&)
         (has_type j~97$ K&)
         (has_type id_1~99$ ID&)
         (has_type id_2~101$ ID&)
        )
        (=>
         (and
          (and
           (and
            (and
             (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
             (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
               K&. K& ID&. ID& dm~2@
              ) i~95$ id_1~99$
            ))
            (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
           )
           (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) i~95$ j~97$
          ))
          (not (= id_1~99$ id_2~101$))
         )
         (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) j~97$ id_2~101$
       )))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) i~95$ id_1~99$
        ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
       )
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) i~95$ id_1~99$
        ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) j~97$ id_2~101$
       ))
       :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_35
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_35
   ))))
   :pattern ((ens%delmap_epr!EPRProof.new_preserves_inv. K&. K& ID&. ID& dm~2@ id_zero~4@))
   :qid !!disabled!!internal_ens__delmap_epr!EPRProof.new_preserves_inv._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRProof.new_preserves_inv._definition
)))
(push)
 (declare-const K&. Dcr)
 (declare-const K& Type)
 (declare-const ID&. Dcr)
 (declare-const ID& Type)
 (declare-const dm~2@ Poly)
 (declare-const id_zero~4@ Poly)
 (assert
  (has_type dm~2@ (TYPE%delmap_epr!EPRModel.DMapModel. K&. K& ID&. ID&))
 )
 (assert
  (has_type id_zero~4@ ID&)
 )
 (assert
  (and
   (and
    (forall ((k~14$ Poly) (id~16$ Poly)) (!
      (=>
       (and
        (has_type k~14$ K&)
        (has_type id~16$ ID&)
       )
       (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~14$ id~16$) (= id~16$ id_zero~4@))
      )
      :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~14$ id~16$))
      :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_41
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_41
    ))
    (forall ((k~48$ Poly) (id~50$ Poly)) (!
      (=>
       (and
        (has_type k~48$ K&)
        (has_type id~50$ ID&)
       )
       (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) k~48$ id~50$
        ) (and
         (= k~48$ (delmap_epr!EPRModel.key_zero.? K&. K&))
         (= id~50$ id_zero~4@)
      )))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) k~48$ id~50$
      ))
      :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_42
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_42
   )))
   (forall ((k~97$ Poly) (j~99$ Poly)) (!
     (=>
      (and
       (has_type k~97$ K&)
       (has_type j~99$ K&)
      )
      (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) k~97$ j~99$
     ))
     :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) k~97$ j~99$
     ))
     :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_43
     :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_43
 ))))
 ;; postcondition not satisfied
 (declare-const %%location_label%%0 Bool)
 (declare-const %%query%% Bool)
 (assert
  (=>
   %%query%%
   (not (=>
     %%location_label%%0
     (and
      (and
       (and
        (exists ((id~13$ Poly)) (!
          (and
           (has_type id~13$ ID&)
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
          ))
          :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_36
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_36
        ))
        (forall ((k~34$ Poly)) (!
          (=>
           (has_type k~34$ K&)
           (exists ((id~42$ Poly)) (!
             (and
              (has_type id~42$ ID&)
              (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
             )
             :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_37
             :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_37
          )))
          :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_38
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_38
       )))
       (forall ((k~60$ Poly) (id~62$ Poly)) (!
         (=>
          (and
           (has_type k~60$ K&)
           (has_type id~62$ ID&)
          )
          (=>
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) k~60$ id~62$
           )
           (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
         ))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) k~60$ id~62$
         ))
         :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
         :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_39
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_39
      )))
      (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
        (=>
         (and
          (has_type i~95$ K&)
          (has_type j~97$ K&)
          (has_type id_1~99$ ID&)
          (has_type id_2~101$ ID&)
         )
         (=>
          (and
           (and
            (and
             (and
              (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
              (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                K&. K& ID&. ID& dm~2@
               ) i~95$ id_1~99$
             ))
             (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
            )
            (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) i~95$ j~97$
           ))
           (not (= id_1~99$ id_2~101$))
          )
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) j~97$ id_2~101$
        )))
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) i~95$ id_1~99$
         ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
        )
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) i~95$ id_1~99$
         ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) j~97$ id_2~101$
        ))
        :qid !!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_40
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__new_preserves_inv_40
 )))))))
 (get-info :version)
 (assert
  %%query%%
 )
 (set-option :rlimit 0)
 (check-sat)
 (set-option :rlimit 0)
(pop)
(declare-fun req%delmap_epr!EPRProof.set_postcondition. (Dcr Type Dcr Type Poly Poly
  Poly Poly Poly Poly Poly Poly Poly
 ) Bool
)
(declare-const %%global_location_label%%3 Bool)
(declare-const %%global_location_label%%4 Bool)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (dm_~4@ Poly) (lo~6@
    Poly
   ) (hi~8@ Poly) (dst~10@ Poly) (hi_id~12@ Poly) (hi_glb~14@ Poly) (lows_1~16@ Poly)
   (lows_2~18@ Poly)
  ) (!
   (= (req%delmap_epr!EPRProof.set_postcondition. K&. K& ID&. ID& dm~2@ dm_~4@ lo~6@ hi~8@
     dst~10@ hi_id~12@ hi_glb~14@ lows_1~16@ lows_2~18@
    ) (and
     (=>
      %%global_location_label%%3
      (and
       (and
        (and
         (exists ((id~13$ Poly)) (!
           (and
            (has_type id~13$ ID&)
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
           ))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
           ))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_44
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_44
         ))
         (forall ((k~34$ Poly)) (!
           (=>
            (has_type k~34$ K&)
            (exists ((id~42$ Poly)) (!
              (and
               (has_type id~42$ ID&)
               (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
              )
              :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_45
              :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_45
           )))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_46
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_46
        )))
        (forall ((k~60$ Poly) (id~62$ Poly)) (!
          (=>
           (and
            (has_type k~60$ K&)
            (has_type id~62$ ID&)
           )
           (=>
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) k~60$ id~62$
            )
            (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) k~60$ id~62$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_47
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_47
       )))
       (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
         (=>
          (and
           (has_type i~95$ K&)
           (has_type j~97$ K&)
           (has_type id_1~99$ ID&)
           (has_type id_2~101$ ID&)
          )
          (=>
           (and
            (and
             (and
              (and
               (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
               (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) i~95$ id_1~99$
              ))
              (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
             )
             (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
               K&. K& ID&. ID& dm~2@
              ) i~95$ j~97$
            ))
            (not (= id_1~99$ id_2~101$))
           )
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) j~97$ id_2~101$
         )))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) i~95$ id_1~99$
          ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
         )
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) i~95$ id_1~99$
          ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) j~97$ id_2~101$
         ))
         :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_48
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_48
     ))))
     (=>
      %%global_location_label%%4
      (and
       (and
        (and
         (and
          (and
           (and
            (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ lo~6@))
            (and
             (and
              (and
               (and
                (delmap_epr!EPRModel.key_le.? K&. K& hi_glb~14@ hi~8@)
                (exists ((id~24$ Poly)) (!
                  (and
                   (has_type id~24$ ID&)
                   (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                     K&. K& ID&. ID& dm~2@
                    ) hi_glb~14@ id~24$
                  ))
                  :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                     K&. K& ID&. ID& dm~2@
                    ) hi_glb~14@ id~24$
                  ))
                  :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_49
                  :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_49
               )))
               (=>
                (exists ((id~46$ Poly)) (!
                  (and
                   (has_type id~46$ ID&)
                   (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                     K&. K& ID&. ID& dm~2@
                    ) hi~8@ id~46$
                  ))
                  :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                     K&. K& ID&. ID& dm~2@
                    ) hi~8@ id~46$
                  ))
                  :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_50
                  :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_50
                ))
                (= hi_glb~14@ hi~8@)
              ))
              (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                K&. K& ID&. ID& dm~2@
               ) hi_glb~14@ hi~8@
             ))
             (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
               K&. K& ID&. ID& dm~2@
              ) hi_glb~14@ hi_id~12@
           )))
           (forall ((k~50$ Poly)) (!
             (=>
              (has_type k~50$ K&)
              (=>
               (and
                (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~50$)
                (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~50$))
               )
               (forall ((id~79$ Poly)) (!
                 (=>
                  (has_type id~79$ ID&)
                  (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~50$ id~79$) (= id~79$
                    dst~10@
                 )))
                 :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~50$ id~79$))
                 :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_51
                 :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_51
             ))))
             :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~50$))
             :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~50$))
             :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_52
             :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_52
          )))
          (forall ((k~113$ Poly)) (!
            (=>
             (has_type k~113$ K&)
             (=>
              (not (and
                (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~113$)
                (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~113$))
              ))
              (forall ((id~143$ Poly)) (!
                (=>
                 (has_type id~143$ ID&)
                 (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~113$ id~143$) (delmap_epr!EPRModel.impl&%1.m.?
                   K&. K& ID&. ID& dm~2@ k~113$ id~143$
                )))
                :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~113$ id~143$))
                :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~113$ id~143$))
                :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_53
                :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_53
            ))))
            :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~113$))
            :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~113$))
            :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_54
            :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_54
         )))
         (and
          (forall ((k~17$ Poly) (id~19$ Poly)) (!
            (=>
             (and
              (has_type k~17$ K&)
              (has_type id~19$ ID&)
             )
             (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$) (ite
               (= hi~8@ k~17$)
               (= id~19$ hi_id~12@)
               (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) k~17$ id~19$
            ))))
            :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$))
            :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
               K&. K& ID&. ID& dm~2@
              ) k~17$ id~19$
            ))
            :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_55
            :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_55
          ))
          (forall ((x~74$ Poly) (y~76$ Poly)) (!
            (=>
             (and
              (has_type x~74$ K&)
              (has_type y~76$ K&)
             )
             (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~74$ y~76$) (and
               (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) x~74$ y~76$
               )
               (not (and
                 (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ x~74$))
                 (not (delmap_epr!EPRModel.key_le.? K&. K& y~76$ hi~8@))
            )))))
            :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~74$ y~76$))
            :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
               K&. K& ID&. ID& dm~2@
              ) x~74$ y~76$
            ))
            :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ x~74$) (delmap_epr!EPRModel.key_le.?
              K&. K& y~76$ hi~8@
            ))
            :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_56
            :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_56
        ))))
        (and
         (forall ((k~17$ Poly) (id~19$ Poly)) (!
           (=>
            (and
             (has_type k~17$ K&)
             (has_type id~19$ ID&)
            )
            (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$) (and
              (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$)
              (not (and
                (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~17$)
                (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~17$))
           )))))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_57
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_57
         ))
         (forall ((x~68$ Poly) (y~70$ Poly)) (!
           (=>
            (and
             (has_type x~68$ K&)
             (has_type y~70$ K&)
            )
            (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~68$ y~70$) (or
              (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ y~70$)
              (and
               (and
                (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ lo~6@)
                (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ hi~8@ y~70$)
               )
               (or
                (delmap_epr!EPRModel.key_le.? K&. K& y~70$ hi~8@)
                (not (exists ((id~12$ Poly)) (!
                   (and
                    (has_type id~12$ ID&)
                    (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ hi~8@ id~12$)
                   )
                   :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ hi~8@ id~12$))
                   :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_58
                   :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_58
           ))))))))
           :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~68$ y~70$))
           :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ y~70$))
           :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ lo~6@)
            (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ hi~8@ y~70$)
           )
           :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ lo~6@)
            (delmap_epr!EPRModel.key_le.? K&. K& y~70$ hi~8@)
           )
           :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_59
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_59
       ))))
       (and
        (forall ((k~17$ Poly) (id~19$ Poly)) (!
          (=>
           (and
            (has_type k~17$ K&)
            (has_type id~19$ ID&)
           )
           (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm_~4@
             ) k~17$ id~19$
            ) (ite
             (= lo~6@ k~17$)
             (= id~19$ dst~10@)
             (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$)
          )))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) k~17$ id~19$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_60
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_60
        ))
        (forall ((x~74$ Poly) (y~76$ Poly)) (!
          (=>
           (and
            (has_type x~74$ K&)
            (has_type y~76$ K&)
           )
           (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm_~4@
             ) x~74$ y~76$
            ) (and
             (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~74$ y~76$)
             (not (and
               (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$))
               (not (delmap_epr!EPRModel.key_le.? K&. K& y~76$ lo~6@))
          )))))
          :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) x~74$ y~76$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~74$ y~76$))
          :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$) (delmap_epr!EPRModel.key_le.?
            K&. K& y~76$ lo~6@
          ))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_61
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_61
   )))))))
   :pattern ((req%delmap_epr!EPRProof.set_postcondition. K&. K& ID&. ID& dm~2@ dm_~4@
     lo~6@ hi~8@ dst~10@ hi_id~12@ hi_glb~14@ lows_1~16@ lows_2~18@
   ))
   :qid !!disabled!!internal_req__delmap_epr!EPRProof.set_postcondition._definition
   :skolemid skolem_!!disabled!!internal_req__delmap_epr!EPRProof.set_postcondition._definition
)))
(declare-fun ens%delmap_epr!EPRProof.set_postcondition. (Dcr Type Dcr Type Poly Poly
  Poly Poly Poly Poly Poly Poly Poly
 ) Bool
)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (dm_~4@ Poly) (lo~6@
    Poly
   ) (hi~8@ Poly) (dst~10@ Poly) (hi_id~12@ Poly) (hi_glb~14@ Poly) (lows_1~16@ Poly)
   (lows_2~18@ Poly)
  ) (!
   (= (ens%delmap_epr!EPRProof.set_postcondition. K&. K& ID&. ID& dm~2@ dm_~4@ lo~6@ hi~8@
     dst~10@ hi_id~12@ hi_glb~14@ lows_1~16@ lows_2~18@
    ) (and
     (forall ((k~64$ Poly)) (!
       (=>
        (has_type k~64$ K&)
        (=>
         (and
          (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~64$)
          (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~64$))
         )
         (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~64$ dst~10@)
       ))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~64$))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~64$))
       :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~64$ dst~10@))
       :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_62
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_62
     ))
     (forall ((k~103$ Poly)) (!
       (=>
        (has_type k~103$ K&)
        (=>
         (not (and
           (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~103$)
           (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~103$))
         ))
         (forall ((id~133$ Poly)) (!
           (=>
            (has_type id~133$ ID&)
            (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~103$ id~133$) (delmap_epr!EPRModel.impl&%1.m.?
              K&. K& ID&. ID& dm~2@ k~103$ id~133$
           )))
           :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~103$ id~133$))
           :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~103$ id~133$))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_63
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_63
       ))))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~103$))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~103$))
       :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_64
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_64
     ))
     (and
      (and
       (and
        (exists ((id~13$ Poly)) (!
          (and
           (has_type id~13$ ID&)
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
          ))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_65
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_65
        ))
        (forall ((k~34$ Poly)) (!
          (=>
           (has_type k~34$ K&)
           (exists ((id~42$ Poly)) (!
             (and
              (has_type id~42$ ID&)
              (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~34$ id~42$)
             )
             :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_66
             :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_66
          )))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_67
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_67
       )))
       (forall ((k~60$ Poly) (id~62$ Poly)) (!
         (=>
          (and
           (has_type k~60$ K&)
           (has_type id~62$ ID&)
          )
          (=>
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) k~60$ id~62$
           )
           (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$)
         ))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm_~4@
           ) k~60$ id~62$
         ))
         :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$))
         :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_68
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_68
      )))
      (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
        (=>
         (and
          (has_type i~95$ K&)
          (has_type j~97$ K&)
          (has_type id_1~99$ ID&)
          (has_type id_2~101$ ID&)
         )
         (=>
          (and
           (and
            (and
             (and
              (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
              (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                K&. K& ID&. ID& dm_~4@
               ) i~95$ id_1~99$
             ))
             (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
            )
            (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm_~4@
             ) i~95$ j~97$
           ))
           (not (= id_1~99$ id_2~101$))
          )
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm_~4@
           ) j~97$ id_2~101$
        )))
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm_~4@
          ) i~95$ id_1~99$
         ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
        )
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm_~4@
          ) i~95$ id_1~99$
         ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm_~4@
          ) j~97$ id_2~101$
        ))
        :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_69
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_69
   )))))
   :pattern ((ens%delmap_epr!EPRProof.set_postcondition. K&. K& ID&. ID& dm~2@ dm_~4@
     lo~6@ hi~8@ dst~10@ hi_id~12@ hi_glb~14@ lows_1~16@ lows_2~18@
   ))
   :qid !!disabled!!internal_ens__delmap_epr!EPRProof.set_postcondition._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRProof.set_postcondition._definition
)))
(push)
 (declare-const K&. Dcr)
 (declare-const K& Type)
 (declare-const ID&. Dcr)
 (declare-const ID& Type)
 (declare-const dm~2@ Poly)
 (declare-const dm_~4@ Poly)
 (declare-const lo~6@ Poly)
 (declare-const hi~8@ Poly)
 (declare-const dst~10@ Poly)
 (declare-const hi_id~12@ Poly)
 (declare-const hi_glb~14@ Poly)
 (declare-const lows_1~16@ Poly)
 (declare-const lows_2~18@ Poly)
 (declare-const tmp%1@ Poly)
 (declare-const tmp%2@ Poly)
 (declare-const tmp%3@ Poly)
 (declare-const tmp%4@ Poly)
 (assert
  (has_type dm~2@ (TYPE%delmap_epr!EPRModel.DMapModel. K&. K& ID&. ID&))
 )
 (assert
  (has_type dm_~4@ (TYPE%delmap_epr!EPRModel.DMapModel. K&. K& ID&. ID&))
 )
 (assert
  (has_type lo~6@ K&)
 )
 (assert
  (has_type hi~8@ K&)
 )
 (assert
  (has_type dst~10@ ID&)
 )
 (assert
  (has_type hi_id~12@ ID&)
 )
 (assert
  (has_type hi_glb~14@ K&)
 )
 (assert
  (has_type lows_1~16@ (TYPE%delmap_epr!EPRModel.SOMapModel. K&. K& ID&. ID&))
 )
 (assert
  (has_type lows_2~18@ (TYPE%delmap_epr!EPRModel.SOMapModel. K&. K& ID&. ID&))
 )
 (assert
  (and
   (and
    (and
     (exists ((id~13$ Poly)) (!
       (and
        (has_type id~13$ ID&)
        (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
       ))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
       ))
       :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_78
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_78
     ))
     (forall ((k~34$ Poly)) (!
       (=>
        (has_type k~34$ K&)
        (exists ((id~42$ Poly)) (!
          (and
           (has_type id~42$ ID&)
           (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
          )
          :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_79
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_79
       )))
       :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_80
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_80
    )))
    (forall ((k~60$ Poly) (id~62$ Poly)) (!
      (=>
       (and
        (has_type k~60$ K&)
        (has_type id~62$ ID&)
       )
       (=>
        (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) k~60$ id~62$
        )
        (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) k~60$ id~62$
      ))
      :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
      :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_81
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_81
   )))
   (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
     (=>
      (and
       (has_type i~95$ K&)
       (has_type j~97$ K&)
       (has_type id_1~99$ ID&)
       (has_type id_2~101$ ID&)
      )
      (=>
       (and
        (and
         (and
          (and
           (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) i~95$ id_1~99$
          ))
          (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
         )
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) i~95$ j~97$
        ))
        (not (= id_1~99$ id_2~101$))
       )
       (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) j~97$ id_2~101$
     )))
     :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) i~95$ id_1~99$
      ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
     )
     :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) i~95$ id_1~99$
      ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) j~97$ id_2~101$
     ))
     :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_82
     :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_82
 ))))
 (assert
  (and
   (and
    (and
     (and
      (and
       (and
        (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ lo~6@))
        (and
         (and
          (and
           (and
            (delmap_epr!EPRModel.key_le.? K&. K& hi_glb~14@ hi~8@)
            (exists ((id~24$ Poly)) (!
              (and
               (has_type id~24$ ID&)
               (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) hi_glb~14@ id~24$
              ))
              :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) hi_glb~14@ id~24$
              ))
              :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_83
              :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_83
           )))
           (=>
            (exists ((id~46$ Poly)) (!
              (and
               (has_type id~46$ ID&)
               (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) hi~8@ id~46$
              ))
              :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) hi~8@ id~46$
              ))
              :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_84
              :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_84
            ))
            (= hi_glb~14@ hi~8@)
          ))
          (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) hi_glb~14@ hi~8@
         ))
         (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) hi_glb~14@ hi_id~12@
       )))
       (forall ((k~50$ Poly)) (!
         (=>
          (has_type k~50$ K&)
          (=>
           (and
            (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~50$)
            (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~50$))
           )
           (forall ((id~79$ Poly)) (!
             (=>
              (has_type id~79$ ID&)
              (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~50$ id~79$) (= id~79$
                dst~10@
             )))
             :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~50$ id~79$))
             :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_85
             :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_85
         ))))
         :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~50$))
         :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~50$))
         :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_86
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_86
      )))
      (forall ((k~113$ Poly)) (!
        (=>
         (has_type k~113$ K&)
         (=>
          (not (and
            (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~113$)
            (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~113$))
          ))
          (forall ((id~143$ Poly)) (!
            (=>
             (has_type id~143$ ID&)
             (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~113$ id~143$) (delmap_epr!EPRModel.impl&%1.m.?
               K&. K& ID&. ID& dm~2@ k~113$ id~143$
            )))
            :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~113$ id~143$))
            :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~113$ id~143$))
            :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_87
            :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_87
        ))))
        :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~113$))
        :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~113$))
        :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_88
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_88
     )))
     (and
      (forall ((k~17$ Poly) (id~19$ Poly)) (!
        (=>
         (and
          (has_type k~17$ K&)
          (has_type id~19$ ID&)
         )
         (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$) (ite
           (= hi~8@ k~17$)
           (= id~19$ hi_id~12@)
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) k~17$ id~19$
        ))))
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$))
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) k~17$ id~19$
        ))
        :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_89
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_89
      ))
      (forall ((x~74$ Poly) (y~76$ Poly)) (!
        (=>
         (and
          (has_type x~74$ K&)
          (has_type y~76$ K&)
         )
         (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~74$ y~76$) (and
           (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) x~74$ y~76$
           )
           (not (and
             (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ x~74$))
             (not (delmap_epr!EPRModel.key_le.? K&. K& y~76$ hi~8@))
        )))))
        :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~74$ y~76$))
        :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) x~74$ y~76$
        ))
        :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ x~74$) (delmap_epr!EPRModel.key_le.?
          K&. K& y~76$ hi~8@
        ))
        :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_90
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_90
    ))))
    (and
     (forall ((k~17$ Poly) (id~19$ Poly)) (!
       (=>
        (and
         (has_type k~17$ K&)
         (has_type id~19$ ID&)
        )
        (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$) (and
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$)
          (not (and
            (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~17$)
            (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~17$))
       )))))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ k~17$ id~19$))
       :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_91
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_91
     ))
     (forall ((x~68$ Poly) (y~70$ Poly)) (!
       (=>
        (and
         (has_type x~68$ K&)
         (has_type y~70$ K&)
        )
        (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~68$ y~70$) (or
          (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ y~70$)
          (and
           (and
            (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ lo~6@)
            (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ hi~8@ y~70$)
           )
           (or
            (delmap_epr!EPRModel.key_le.? K&. K& y~70$ hi~8@)
            (not (exists ((id~12$ Poly)) (!
               (and
                (has_type id~12$ ID&)
                (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ hi~8@ id~12$)
               )
               :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_1~16@ hi~8@ id~12$))
               :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_92
               :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_92
       ))))))))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~68$ y~70$))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ y~70$))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ lo~6@)
        (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ hi~8@ y~70$)
       )
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_1~16@ x~68$ lo~6@)
        (delmap_epr!EPRModel.key_le.? K&. K& y~70$ hi~8@)
       )
       :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_93
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_93
   ))))
   (and
    (forall ((k~17$ Poly) (id~19$ Poly)) (!
      (=>
       (and
        (has_type k~17$ K&)
        (has_type id~19$ ID&)
       )
       (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm_~4@
         ) k~17$ id~19$
        ) (ite
         (= lo~6@ k~17$)
         (= id~19$ dst~10@)
         (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$)
      )))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm_~4@
        ) k~17$ id~19$
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~18@ k~17$ id~19$))
      :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_94
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_94
    ))
    (forall ((x~74$ Poly) (y~76$ Poly)) (!
      (=>
       (and
        (has_type x~74$ K&)
        (has_type y~76$ K&)
       )
       (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm_~4@
         ) x~74$ y~76$
        ) (and
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~74$ y~76$)
         (not (and
           (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$))
           (not (delmap_epr!EPRModel.key_le.? K&. K& y~76$ lo~6@))
      )))))
      :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm_~4@
        ) x~74$ y~76$
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~18@ x~74$ y~76$))
      :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$) (delmap_epr!EPRModel.key_le.?
        K&. K& y~76$ lo~6@
      ))
      :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_95
      :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_95
 )))))
 ;; !!! postcondition not satisfied
 (declare-const %%location_label%%0 Bool)
 ;; !!! postcondition not satisfied
 (declare-const %%location_label%%1 Bool)
 ;; !!! postcondition not satisfied
 (declare-const %%location_label%%2 Bool)
 (declare-const %%query%% Bool)
 (assert
  (=>
   %%query%%
   (not (=>
     (ens%delmap_epr!EPRModel.key_le_properties. K&. K&)
     (=>
      (= tmp%1@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm~2@))
      (=>
       (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& tmp%1@)
       (=>
        (= tmp%2@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm~2@))
        (=>
         (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& tmp%2@)
         (=>
          (ens%delmap_epr!EPRModel.impl&%1.map_properties. K&. K& ID&. ID& dm~2@)
          (=>
           (= tmp%3@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm_~4@))
           (=>
            (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& tmp%3@)
            (=>
             (= tmp%4@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm_~4@))
             (=>
              (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& tmp%4@)
              (=>
               (ens%delmap_epr!EPRModel.impl&%1.map_properties. K&. K& ID&. ID& dm_~4@)
               (=>
                (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& lows_1~16@)
                (=>
                 (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& lows_1~16@)
                 (=>
                  (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& lows_2~18@)
                  (=>
                   (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& lows_2~18@)
                   (and
                    (=>
                     %%location_label%%0
                     (forall ((k~64$ Poly)) (!
                       (=>
                        (has_type k~64$ K&)
                        (=>
                         (and
                          (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~64$)
                          (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~64$))
                         )
                         (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~64$ dst~10@)
                       ))
                       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~64$))
                       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~64$))
                       :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~64$ dst~10@))
                       :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_70
                       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_70
                    )))
                    (and
                     (=>
                      %%location_label%%1
                      (forall ((k~103$ Poly)) (!
                        (=>
                         (has_type k~103$ K&)
                         (=>
                          (not (and
                            (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~103$)
                            (not (delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~103$))
                          ))
                          (forall ((id~133$ Poly)) (!
                            (=>
                             (has_type id~133$ ID&)
                             (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~103$ id~133$) (delmap_epr!EPRModel.impl&%1.m.?
                               K&. K& ID&. ID& dm~2@ k~103$ id~133$
                            )))
                            :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~103$ id~133$))
                            :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~103$ id~133$))
                            :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_71
                            :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_71
                        ))))
                        :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~103$))
                        :pattern ((delmap_epr!EPRModel.key_le.? K&. K& hi~8@ k~103$))
                        :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_72
                        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_72
                     )))
                     (=>
                      %%location_label%%2
                      (and
                       (and
                        (and
                         (exists ((id~13$ Poly)) (!
                           (and
                            (has_type id~13$ ID&)
                            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                              K&. K& ID&. ID& dm_~4@
                             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
                           ))
                           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                              K&. K& ID&. ID& dm_~4@
                             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
                           ))
                           :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_73
                           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_73
                         ))
                         (forall ((k~34$ Poly)) (!
                           (=>
                            (has_type k~34$ K&)
                            (exists ((id~42$ Poly)) (!
                              (and
                               (has_type id~42$ ID&)
                               (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~34$ id~42$)
                              )
                              :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_74
                              :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_74
                           )))
                           :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_75
                           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_75
                        )))
                        (forall ((k~60$ Poly) (id~62$ Poly)) (!
                          (=>
                           (and
                            (has_type k~60$ K&)
                            (has_type id~62$ ID&)
                           )
                           (=>
                            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                              K&. K& ID&. ID& dm_~4@
                             ) k~60$ id~62$
                            )
                            (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$)
                          ))
                          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                             K&. K& ID&. ID& dm_~4@
                            ) k~60$ id~62$
                          ))
                          :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$))
                          :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_76
                          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_76
                       )))
                       (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
                         (=>
                          (and
                           (has_type i~95$ K&)
                           (has_type j~97$ K&)
                           (has_type id_1~99$ ID&)
                           (has_type id_2~101$ ID&)
                          )
                          (=>
                           (and
                            (and
                             (and
                              (and
                               (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
                               (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                                 K&. K& ID&. ID& dm_~4@
                                ) i~95$ id_1~99$
                              ))
                              (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
                             )
                             (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                               K&. K& ID&. ID& dm_~4@
                              ) i~95$ j~97$
                            ))
                            (not (= id_1~99$ id_2~101$))
                           )
                           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                             K&. K& ID&. ID& dm_~4@
                            ) j~97$ id_2~101$
                         )))
                         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                            K&. K& ID&. ID& dm_~4@
                           ) i~95$ id_1~99$
                          ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
                         )
                         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                            K&. K& ID&. ID& dm_~4@
                           ) i~95$ id_1~99$
                          ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                            K&. K& ID&. ID& dm_~4@
                           ) j~97$ id_2~101$
                         ))
                         :qid !!disabled!!user_delmap_epr__EPRProof__set_postcondition_77
                         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_postcondition_77
 ))))))))))))))))))))))))
 (get-info :version)
 (assert
  %%query%%
 )
 (set-option :rlimit 0)
 (check-sat)
 (set-option :rlimit 0)
 (get-model)
 (assert
  (not %%location_label%%2)
 )
(pop)
(declare-fun req%delmap_epr!EPRProof.set_unbounded_postcondition. (Dcr Type Dcr Type
  Poly Poly Poly Poly Poly
 ) Bool
)
(declare-const %%global_location_label%%5 Bool)
(declare-const %%global_location_label%%6 Bool)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (dm_~4@ Poly) (lo~6@
    Poly
   ) (dst~8@ Poly) (lows_2~10@ Poly)
  ) (!
   (= (req%delmap_epr!EPRProof.set_unbounded_postcondition. K&. K& ID&. ID& dm~2@ dm_~4@
     lo~6@ dst~8@ lows_2~10@
    ) (and
     (=>
      %%global_location_label%%5
      (and
       (and
        (and
         (exists ((id~13$ Poly)) (!
           (and
            (has_type id~13$ ID&)
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
           ))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
           ))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_96
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_96
         ))
         (forall ((k~34$ Poly)) (!
           (=>
            (has_type k~34$ K&)
            (exists ((id~42$ Poly)) (!
              (and
               (has_type id~42$ ID&)
               (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
              )
              :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_97
              :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_97
           )))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_98
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_98
        )))
        (forall ((k~60$ Poly) (id~62$ Poly)) (!
          (=>
           (and
            (has_type k~60$ K&)
            (has_type id~62$ ID&)
           )
           (=>
            (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) k~60$ id~62$
            )
            (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) k~60$ id~62$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_99
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_99
       )))
       (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
         (=>
          (and
           (has_type i~95$ K&)
           (has_type j~97$ K&)
           (has_type id_1~99$ ID&)
           (has_type id_2~101$ ID&)
          )
          (=>
           (and
            (and
             (and
              (and
               (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
               (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                 K&. K& ID&. ID& dm~2@
                ) i~95$ id_1~99$
              ))
              (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
             )
             (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
               K&. K& ID&. ID& dm~2@
              ) i~95$ j~97$
            ))
            (not (= id_1~99$ id_2~101$))
           )
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) j~97$ id_2~101$
         )))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) i~95$ id_1~99$
          ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
         )
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) i~95$ id_1~99$
          ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) j~97$ id_2~101$
         ))
         :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_100
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_100
     ))))
     (=>
      %%global_location_label%%6
      (and
       (and
        (and
         (forall ((k~21$ Poly)) (!
           (=>
            (has_type k~21$ K&)
            (=>
             (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~21$)
             (forall ((id~41$ Poly)) (!
               (=>
                (has_type id~41$ ID&)
                (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~21$ id~41$) (= id~41$
                  dst~8@
               )))
               :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~21$ id~41$))
               :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_101
               :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_101
           ))))
           :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~21$))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_102
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_102
         ))
         (forall ((k~75$ Poly)) (!
           (=>
            (has_type k~75$ K&)
            (=>
             (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~75$))
             (forall ((id~96$ Poly)) (!
               (=>
                (has_type id~96$ ID&)
                (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~75$ id~96$) (delmap_epr!EPRModel.impl&%1.m.?
                  K&. K& ID&. ID& dm~2@ k~75$ id~96$
               )))
               :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~75$ id~96$))
               :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~75$ id~96$))
               :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_103
               :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_103
           ))))
           :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~75$))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_104
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_104
        )))
        (and
         (forall ((k~15$ Poly) (id~17$ Poly)) (!
           (=>
            (and
             (has_type k~15$ K&)
             (has_type id~17$ ID&)
            )
            (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~15$ id~17$) (and
              (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                K&. K& ID&. ID& dm~2@
               ) k~15$ id~17$
              )
              (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~15$))
           )))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~15$ id~17$))
           :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) k~15$ id~17$
           ))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_105
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_105
         ))
         (forall ((x~57$ Poly) (y~59$ Poly)) (!
           (=>
            (and
             (has_type x~57$ K&)
             (has_type y~59$ K&)
            )
            (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~57$ y~59$) (or
              (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                K&. K& ID&. ID& dm~2@
               ) x~57$ y~59$
              )
              (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                K&. K& ID&. ID& dm~2@
               ) x~57$ lo~6@
           ))))
           :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~57$ y~59$))
           :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm~2@
             ) x~57$ y~59$
           ))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_106
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_106
       ))))
       (and
        (forall ((k~17$ Poly) (id~19$ Poly)) (!
          (=>
           (and
            (has_type k~17$ K&)
            (has_type id~19$ ID&)
           )
           (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm_~4@
             ) k~17$ id~19$
            ) (ite
             (= lo~6@ k~17$)
             (= id~19$ dst~8@)
             (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~17$ id~19$)
          )))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) k~17$ id~19$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~17$ id~19$))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_107
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_107
        ))
        (forall ((x~74$ Poly) (y~76$ Poly)) (!
          (=>
           (and
            (has_type x~74$ K&)
            (has_type y~76$ K&)
           )
           (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm_~4@
             ) x~74$ y~76$
            ) (and
             (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~74$ y~76$)
             (not (and
               (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$))
               (not (delmap_epr!EPRModel.key_le.? K&. K& y~76$ lo~6@))
          )))))
          :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) x~74$ y~76$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~74$ y~76$))
          :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$) (delmap_epr!EPRModel.key_le.?
            K&. K& y~76$ lo~6@
          ))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_108
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_108
   )))))))
   :pattern ((req%delmap_epr!EPRProof.set_unbounded_postcondition. K&. K& ID&. ID& dm~2@
     dm_~4@ lo~6@ dst~8@ lows_2~10@
   ))
   :qid !!disabled!!internal_req__delmap_epr!EPRProof.set_unbounded_postcondition._definition
   :skolemid skolem_!!disabled!!internal_req__delmap_epr!EPRProof.set_unbounded_postcondition._definition
)))
(declare-fun ens%delmap_epr!EPRProof.set_unbounded_postcondition. (Dcr Type Dcr Type
  Poly Poly Poly Poly Poly
 ) Bool
)
(assert
 (forall ((K&. Dcr) (K& Type) (ID&. Dcr) (ID& Type) (dm~2@ Poly) (dm_~4@ Poly) (lo~6@
    Poly
   ) (dst~8@ Poly) (lows_2~10@ Poly)
  ) (!
   (= (ens%delmap_epr!EPRProof.set_unbounded_postcondition. K&. K& ID&. ID& dm~2@ dm_~4@
     lo~6@ dst~8@ lows_2~10@
    ) (and
     (forall ((k~48$ Poly)) (!
       (=>
        (has_type k~48$ K&)
        (=>
         (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~48$)
         (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~48$ dst~8@)
       ))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~48$))
       :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~48$ dst~8@))
       :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_109
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_109
     ))
     (forall ((k~78$ Poly)) (!
       (=>
        (has_type k~78$ K&)
        (=>
         (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~78$))
         (forall ((id~99$ Poly)) (!
           (=>
            (has_type id~99$ ID&)
            (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~78$ id~99$) (delmap_epr!EPRModel.impl&%1.m.?
              K&. K& ID&. ID& dm~2@ k~78$ id~99$
           )))
           :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~78$ id~99$))
           :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~78$ id~99$))
           :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_110
           :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_110
       ))))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~78$))
       :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_111
       :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_111
     ))
     (and
      (and
       (and
        (exists ((id~13$ Poly)) (!
          (and
           (has_type id~13$ ID&)
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
          ))
          :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
          ))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_112
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_112
        ))
        (forall ((k~34$ Poly)) (!
          (=>
           (has_type k~34$ K&)
           (exists ((id~42$ Poly)) (!
             (and
              (has_type id~42$ ID&)
              (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~34$ id~42$)
             )
             :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_113
             :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_113
          )))
          :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_114
          :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_114
       )))
       (forall ((k~60$ Poly) (id~62$ Poly)) (!
         (=>
          (and
           (has_type k~60$ K&)
           (has_type id~62$ ID&)
          )
          (=>
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm_~4@
            ) k~60$ id~62$
           )
           (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$)
         ))
         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm_~4@
           ) k~60$ id~62$
         ))
         :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$))
         :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_115
         :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_115
      )))
      (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
        (=>
         (and
          (has_type i~95$ K&)
          (has_type j~97$ K&)
          (has_type id_1~99$ ID&)
          (has_type id_2~101$ ID&)
         )
         (=>
          (and
           (and
            (and
             (and
              (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
              (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                K&. K& ID&. ID& dm_~4@
               ) i~95$ id_1~99$
             ))
             (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
            )
            (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
              K&. K& ID&. ID& dm_~4@
             ) i~95$ j~97$
           ))
           (not (= id_1~99$ id_2~101$))
          )
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm_~4@
           ) j~97$ id_2~101$
        )))
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm_~4@
          ) i~95$ id_1~99$
         ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
        )
        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm_~4@
          ) i~95$ id_1~99$
         ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm_~4@
          ) j~97$ id_2~101$
        ))
        :qid !!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_116
        :skolemid skolem_!!disabled!!user_delmap_epr__EPRProof__set_unbounded_postcondition_116
   )))))
   :pattern ((ens%delmap_epr!EPRProof.set_unbounded_postcondition. K&. K& ID&. ID& dm~2@
     dm_~4@ lo~6@ dst~8@ lows_2~10@
   ))
   :qid !!disabled!!internal_ens__delmap_epr!EPRProof.set_unbounded_postcondition._definition
   :skolemid skolem_!!disabled!!internal_ens__delmap_epr!EPRProof.set_unbounded_postcondition._definition
)))
(push)
 (declare-const K&. Dcr)
 (declare-const K& Type)
 (declare-const ID&. Dcr)
 (declare-const ID& Type)
 (declare-const dm~2@ Poly)
 (declare-const dm_~4@ Poly)
 (declare-const lo~6@ Poly)
 (declare-const dst~8@ Poly)
 (declare-const lows_2~10@ Poly)
 (declare-const tmp%1@ Poly)
 (declare-const tmp%2@ Poly)
 (declare-const tmp%3@ Poly)
 (declare-const tmp%4@ Poly)
 (assert
  (has_type dm~2@ (TYPE%delmap_epr!EPRModel.DMapModel. K&. K& ID&. ID&))
 )
 (assert
  (has_type dm_~4@ (TYPE%delmap_epr!EPRModel.DMapModel. K&. K& ID&. ID&))
 )
 (assert
  (has_type lo~6@ K&)
 )
 (assert
  (has_type dst~8@ ID&)
 )
 (assert
  (has_type lows_2~10@ (TYPE%delmap_epr!EPRModel.SOMapModel. K&. K& ID&. ID&))
 )
 (assert
  (and
   (and
    (and
     (exists ((id~13$ Poly)) (!
       (and
        (has_type id~13$ ID&)
        (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
       ))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
       ))
       :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_125
       :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_125
     ))
     (forall ((k~34$ Poly)) (!
       (=>
        (has_type k~34$ K&)
        (exists ((id~42$ Poly)) (!
          (and
           (has_type id~42$ ID&)
           (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~34$ id~42$)
          )
          :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_126
          :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_126
       )))
       :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_127
       :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_127
    )))
    (forall ((k~60$ Poly) (id~62$ Poly)) (!
      (=>
       (and
        (has_type k~60$ K&)
        (has_type id~62$ ID&)
       )
       (=>
        (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) k~60$ id~62$
        )
        (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$)
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) k~60$ id~62$
      ))
      :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~60$ id~62$))
      :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_128
      :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_128
   )))
   (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
     (=>
      (and
       (has_type i~95$ K&)
       (has_type j~97$ K&)
       (has_type id_1~99$ ID&)
       (has_type id_2~101$ ID&)
      )
      (=>
       (and
        (and
         (and
          (and
           (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
           (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
             K&. K& ID&. ID& dm~2@
            ) i~95$ id_1~99$
          ))
          (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
         )
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
           K&. K& ID&. ID& dm~2@
          ) i~95$ j~97$
        ))
        (not (= id_1~99$ id_2~101$))
       )
       (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm~2@
        ) j~97$ id_2~101$
     )))
     :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) i~95$ id_1~99$
      ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ j~97$ id_2~101$)
     )
     :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) i~95$ id_1~99$
      ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
        K&. K& ID&. ID& dm~2@
       ) j~97$ id_2~101$
     ))
     :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_129
     :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_129
 ))))
 (assert
  (and
   (and
    (and
     (forall ((k~21$ Poly)) (!
       (=>
        (has_type k~21$ K&)
        (=>
         (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~21$)
         (forall ((id~41$ Poly)) (!
           (=>
            (has_type id~41$ ID&)
            (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~21$ id~41$) (= id~41$
              dst~8@
           )))
           :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~21$ id~41$))
           :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_130
           :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_130
       ))))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~21$))
       :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_131
       :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_131
     ))
     (forall ((k~75$ Poly)) (!
       (=>
        (has_type k~75$ K&)
        (=>
         (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~75$))
         (forall ((id~96$ Poly)) (!
           (=>
            (has_type id~96$ ID&)
            (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~75$ id~96$) (delmap_epr!EPRModel.impl&%1.m.?
              K&. K& ID&. ID& dm~2@ k~75$ id~96$
           )))
           :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~75$ id~96$))
           :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~75$ id~96$))
           :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_132
           :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_132
       ))))
       :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~75$))
       :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_133
       :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_133
    )))
    (and
     (forall ((k~15$ Poly) (id~17$ Poly)) (!
       (=>
        (and
         (has_type k~15$ K&)
         (has_type id~17$ ID&)
        )
        (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~15$ id~17$) (and
          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) k~15$ id~17$
          )
          (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~15$))
       )))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~15$ id~17$))
       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) k~15$ id~17$
       ))
       :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_134
       :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_134
     ))
     (forall ((x~57$ Poly) (y~59$ Poly)) (!
       (=>
        (and
         (has_type x~57$ K&)
         (has_type y~59$ K&)
        )
        (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~57$ y~59$) (or
          (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) x~57$ y~59$
          )
          (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
            K&. K& ID&. ID& dm~2@
           ) x~57$ lo~6@
       ))))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~57$ y~59$))
       :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm~2@
         ) x~57$ y~59$
       ))
       :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_135
       :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_135
   ))))
   (and
    (forall ((k~17$ Poly) (id~19$ Poly)) (!
      (=>
       (and
        (has_type k~17$ K&)
        (has_type id~19$ ID&)
       )
       (= (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm_~4@
         ) k~17$ id~19$
        ) (ite
         (= lo~6@ k~17$)
         (= id~19$ dst~8@)
         (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~17$ id~19$)
      )))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm_~4@
        ) k~17$ id~19$
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& lows_2~10@ k~17$ id~19$))
      :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_136
      :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_136
    ))
    (forall ((x~74$ Poly) (y~76$ Poly)) (!
      (=>
       (and
        (has_type x~74$ K&)
        (has_type y~76$ K&)
       )
       (= (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
          K&. K& ID&. ID& dm_~4@
         ) x~74$ y~76$
        ) (and
         (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~74$ y~76$)
         (not (and
           (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$))
           (not (delmap_epr!EPRModel.key_le.? K&. K& y~76$ lo~6@))
      )))))
      :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
         K&. K& ID&. ID& dm_~4@
        ) x~74$ y~76$
      ))
      :pattern ((delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& lows_2~10@ x~74$ y~76$))
      :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ x~74$) (delmap_epr!EPRModel.key_le.?
        K&. K& y~76$ lo~6@
      ))
      :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_137
      :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_137
 )))))
 ;; postcondition not satisfied
 (declare-const %%location_label%%0 Bool)
 ;; postcondition not satisfied
 (declare-const %%location_label%%1 Bool)
 ;; postcondition not satisfied
 (declare-const %%location_label%%2 Bool)
 (declare-const %%query%% Bool)
 (assert
  (=>
   %%query%%
   (not (=>
     (ens%delmap_epr!EPRModel.key_le_properties. K&. K&)
     (=>
      (= tmp%1@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm~2@))
      (=>
       (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& tmp%1@)
       (=>
        (= tmp%2@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm~2@))
        (=>
         (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& tmp%2@)
         (=>
          (ens%delmap_epr!EPRModel.impl&%1.map_properties. K&. K& ID&. ID& dm~2@)
          (=>
           (= tmp%3@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm_~4@))
           (=>
            (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& tmp%3@)
            (=>
             (= tmp%4@ (delmap_epr!EPRModel.impl&%1.lows.? K&. K& ID&. ID& dm_~4@))
             (=>
              (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& tmp%4@)
              (=>
               (ens%delmap_epr!EPRModel.impl&%1.map_properties. K&. K& ID&. ID& dm_~4@)
               (=>
                (ens%delmap_epr!EPRModel.impl&%0.map_properties. K&. K& ID&. ID& lows_2~10@)
                (=>
                 (ens%delmap_epr!EPRModel.impl&%0.gap_properties. K&. K& ID&. ID& lows_2~10@)
                 (and
                  (=>
                   %%location_label%%0
                   (forall ((k~48$ Poly)) (!
                     (=>
                      (has_type k~48$ K&)
                      (=>
                       (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~48$)
                       (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~48$ dst~8@)
                     ))
                     :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~48$))
                     :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~48$ dst~8@))
                     :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_117
                     :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_117
                  )))
                  (and
                   (=>
                    %%location_label%%1
                    (forall ((k~78$ Poly)) (!
                      (=>
                       (has_type k~78$ K&)
                       (=>
                        (not (delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~78$))
                        (forall ((id~99$ Poly)) (!
                          (=>
                           (has_type id~99$ ID&)
                           (= (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~78$ id~99$) (delmap_epr!EPRModel.impl&%1.m.?
                             K&. K& ID&. ID& dm~2@ k~78$ id~99$
                          )))
                          :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~78$ id~99$))
                          :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm~2@ k~78$ id~99$))
                          :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_118
                          :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_118
                      ))))
                      :pattern ((delmap_epr!EPRModel.key_le.? K&. K& lo~6@ k~78$))
                      :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_119
                      :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_119
                   )))
                   (=>
                    %%location_label%%2
                    (and
                     (and
                      (and
                       (exists ((id~13$ Poly)) (!
                         (and
                          (has_type id~13$ ID&)
                          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                            K&. K& ID&. ID& dm_~4@
                           ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
                         ))
                         :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                            K&. K& ID&. ID& dm_~4@
                           ) (delmap_epr!EPRModel.key_zero.? K&. K&) id~13$
                         ))
                         :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_120
                         :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_120
                       ))
                       (forall ((k~34$ Poly)) (!
                         (=>
                          (has_type k~34$ K&)
                          (exists ((id~42$ Poly)) (!
                            (and
                             (has_type id~42$ ID&)
                             (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~34$ id~42$)
                            )
                            :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_121
                            :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_121
                         )))
                         :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_122
                         :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_122
                      )))
                      (forall ((k~60$ Poly) (id~62$ Poly)) (!
                        (=>
                         (and
                          (has_type k~60$ K&)
                          (has_type id~62$ ID&)
                         )
                         (=>
                          (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                            K&. K& ID&. ID& dm_~4@
                           ) k~60$ id~62$
                          )
                          (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$)
                        ))
                        :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                           K&. K& ID&. ID& dm_~4@
                          ) k~60$ id~62$
                        ))
                        :pattern ((delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ k~60$ id~62$))
                        :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_123
                        :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_123
                     )))
                     (forall ((i~95$ Poly) (j~97$ Poly) (id_1~99$ Poly) (id_2~101$ Poly)) (!
                       (=>
                        (and
                         (has_type i~95$ K&)
                         (has_type j~97$ K&)
                         (has_type id_1~99$ ID&)
                         (has_type id_2~101$ ID&)
                        )
                        (=>
                         (and
                          (and
                           (and
                            (and
                             (delmap_epr!EPRModel.key_le.? K&. K& i~95$ j~97$)
                             (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                               K&. K& ID&. ID& dm_~4@
                              ) i~95$ id_1~99$
                            ))
                            (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
                           )
                           (delmap_epr!EPRModel.impl&%0.gap.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                             K&. K& ID&. ID& dm_~4@
                            ) i~95$ j~97$
                          ))
                          (not (= id_1~99$ id_2~101$))
                         )
                         (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                           K&. K& ID&. ID& dm_~4@
                          ) j~97$ id_2~101$
                       )))
                       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                          K&. K& ID&. ID& dm_~4@
                         ) i~95$ id_1~99$
                        ) (delmap_epr!EPRModel.impl&%1.m.? K&. K& ID&. ID& dm_~4@ j~97$ id_2~101$)
                       )
                       :pattern ((delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                          K&. K& ID&. ID& dm_~4@
                         ) i~95$ id_1~99$
                        ) (delmap_epr!EPRModel.impl&%0.m.? K&. K& ID&. ID& (delmap_epr!EPRModel.impl&%1.lows.?
                          K&. K& ID&. ID& dm_~4@
                         ) j~97$ id_2~101$
                       ))
                       :qid user_delmap_epr__EPRProof__set_unbounded_postcondition_124
                       :skolemid skolem_user_delmap_epr__EPRProof__set_unbounded_postcondition_124
 ))))))))))))))))))))))
 (get-info :version)
 (assert
  %%query%%
 )
 (set-option :rlimit 0)
 (check-sat)
 (set-option :rlimit 0)
(pop)
