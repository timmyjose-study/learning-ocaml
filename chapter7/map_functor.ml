(* map with custom keys *)

type name = { first : string ; last : string }

(*
Note:

module OrderedType = sig
  type t
  val compare : t -> t -> int
*)


module Name = struct
  type t = name

  let compare { first = first1 ; last = last1} { first = first2 ; last = last2 } = 
    match String.compare last1 last2 with
    0 -> String.compare first1 first2
    | c -> c
end

module NameMap = Map.Make (Name)