type ('k, 'v) t = ('k * 'v) list

let empty = []

let insert k v m = (k, v) :: List.remove_assoc k m

let lookup k m = List.assoc k m

let keys m = List.(m |> map fst |> sort_uniq Stdlib.compare)

let bindings m = m
