module type MyMapSig = sig
  type ('k, 'v) t
  val empty : ('k, 'v) t
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
  val lookup : 'k -> ('k, 'v) t -> 'v
  val keys : ('k, 'v) t -> 'k  list
  val bindings : ('k, 'v) t -> ('k * 'v) list
end

module Assoc_map: MyMapSig = Assoc_map
module UniqAssocMap: MyMapSig = UniqAssocMap
