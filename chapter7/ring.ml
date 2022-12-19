module type RingSig = sig
  type t

  val zero : t
  val one : t
  val ( + ) : t -> t -> t
  val ( * ) : t -> t -> t
  val ( ~- ) : t -> t
  val to_string : t -> string
end

(* specialising module types *)

(* )module type IntRingSig = RingSig with type t = int *)

module IntRing : RingSig with type t = int = struct 
  type t = int

  let zero = 0

  let one = 1

  let ( + ) = Stdlib.( + )
  let ( * ) = Stdlib.( * )
  let ( ~- ) = Stdlib.( ~- )
  let to_string = string_of_int
end

  let pp_string fmt i = 
    Format.fprintf fmt "%s" (IntRing.to_string i)

(* )module type FloatRingSig = RingSig with type t = float *)

module FloatRing : RingSig with type t = float = struct
  type t = float

  let zero = 0.
  let one = 1.
  let ( +  ) = Stdlib.( +. )
  let ( * ) = Stdlib.( *. )
  let ( ~- ) = Stdlib.( ~-. )
  let to_string = string_of_float
end

  let pp_floatstring fmt f = 
    Format.fprintf fmt "%s" (FloatRing.to_string f)