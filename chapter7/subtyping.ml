module M = struct
  let x = 0
  let z = 2
end

module type X = sig
  val x : int
end

module MX = (M : X)

module type Z = sig
  val z : int
end

module MZ = (M : Z)

module type XZ = sig
  val x : int
  val z : int
end

module MXZ = (M : XZ)

(*
module type Y = sig
  val y : int
end

module MY = (M : Y)
*)

(*
module type Xstring = sig
  val x : string
end

module MXstring = (M : Xstring)
*)

module type IntFun = sig
  val f : int -> int
end

module IdFun = struct
  let f x = x
end

module Iid = (IdFun : IntFun)