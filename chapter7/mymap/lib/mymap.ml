module type MyMapSig = sig
  type ('k, 'v) t
  val empty : ('k, 'v) t
  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
  val lookup : 'k -> ('k, 'v) t -> 'v
  val keys : ('k, 'v) t -> 'k  list
  val bindings : ('k, 'v) t -> ('k * 'v) list
end

module Assoc_map : MyMapSig = struct
  type ('k, 'v) t = ('k * 'v) list

  let empty = []

  let insert k v m = (k, v) :: m

  let lookup k m = List.assoc k m

  let keys m = List.(m |> map fst |> sort_uniq Stdlib.compare)

  let bindings m = m |> keys |> List.map (fun k -> (k, lookup k m))
end

module UniqAssocMap : MyMapSig = struct
  type ('k, 'v) t = ('k * 'v) list

  let empty = []

  let insert k v m = (k, v) :: List.remove_assoc k m

  let lookup k m = List.assoc k m

  let keys m = List.(m |> map fst |> sort_uniq Stdlib.compare)

  let bindings m = m
end