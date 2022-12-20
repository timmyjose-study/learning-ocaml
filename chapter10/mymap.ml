module type MyMap = sig
  type ('k, 'v) t

  val insert : 'k -> 'v -> ('k, 'v) t -> ('k, 'v) t
  val find : 'k -> ('k, 'v) t -> 'v option
  val remove : 'k -> ('k, 'v) t -> ('k, 'v) t
  val empty : ('k, 'v) t
  val of_list : ('k * 'v) list -> ('k, 'v) t
  val bindings : ('k, 'v) t -> ('k * 'v) list
end

module ListMap : MyMap = struct
  type ('k, 'v) t = ('k * 'v) list

  let insert k v t = (k, v) :: t

  let find = List.assoc_opt

  let remove k m = List.(m |> filter (fun (kk, _) -> kk <> k))

  let empty = []

  let of_list = Fun.id

  let keys m = List.(m |> map fst |> sort_uniq Stdlib.compare)

  let binding m k = (k, List.assoc k m)

  let bindings m = List.map (binding m) (keys m)
end
