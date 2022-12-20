type ('k, 'v) t = ('k * 'v) list

let empty = []

let insert k v m = (k, v) :: m

let lookup k m = List.assoc k m

let keys m = List.(m |> map fst |> sort_uniq Stdlib.compare)

let bindings m = m |> keys |> List.map (fun k -> (k, lookup k m))
