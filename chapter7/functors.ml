module type X = sig
  val x : int
end

module IncX (M : X) = struct
  let x = M.x + 1
end

module A = IncX (struct let x = 0 end)
module B = IncX (struct let x = 12345 end)

module IncrX = functor (M : X) ->
  struct
    let x = M.x + 1
  end

module D = IncrX (struct let x = 2 end)
module E = IncrX (struct let x = 0 end)

module AddX (M : X) = struct
  let add y = M.x + y
end

module Add10 = AddX (struct let x = 10 end)

module SubX = functor (M : X) -> 
  struct
    let sub y = y - M.x
  end

module Sub10 = SubX (struct let x = 10 end)

module type Add = sig
  val add : int -> int 
end

(* the types match up - that's all that's actually needed *)
module CheckAddX : X -> Add = AddX

module CheckAdd5 = CheckAddX (struct let x = 5 end)

module type T = sig
  type t
  val x : t
end

module Pair1 (M : T) = struct
  let p = (M.x, 1)
end

module type P1 = functor (M : T) -> sig val p : M.t * int end

module Pair1 : P1 = functor (M : T) -> 
  struct
    let p = (M.x, 1)
  end

module P0 = Pair1 (struct type t = int let x = 0 end)
module P1 = Pair1 (struct type t = string let x = "hello" end)

(* subtypes work fine for modules just as for functions *)

module F (M : sig val x : int end) = struct let y = M.x end

module X = struct let x = 0 end

module Z = struct let x = 100 let z = 0 end (* subtype *)

module FX = F (X)
module FZ = F (Z)
