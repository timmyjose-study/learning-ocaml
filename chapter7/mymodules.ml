(* without any signature *)
module MyModule = struct
  let inc x = x + 1
  type colour = Red | Green | Blue
  exception Oops
end

(* with an ad-hoc signature *)
module AnotherModule : sig
  val inc : int -> int 
  type colour = Red | Green | Blue
  exception Oops
end = struct
  let inc x = x + 1
  type colour = Red | Green | Blue
  exception Oops
end

(* with a separate explicit signature *)
module type MyModSig = sig
  val inc : int -> int
  type colour = Red | Green | Blue
  exception Oops
end

module MyMod: MyModSig = struct
  let inc x = x + 1
  type colour = Red | Green | Blue
  exception Oops
end

module M = struct
  let rec even = function
    0 -> true
    | n -> odd (n - 1)
  and odd = function
    0 -> false
    | n -> even (n - 1)
end
  
module M = struct
  open List

  let uppercase_all = map String.uppercase_ascii
end

(* open module in a scope *)
let lower_trim s = 
  let open String in
  s |> trim |> lowercase_ascii

(* better approach - be explicit *)
module M = struct
  let uppercase_all = List.map String.uppercase_ascii
end