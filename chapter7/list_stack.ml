module type StackSig = sig
  type 'a t (* abstract the type away as well *)
  exception Empty
  val empty : 'a t
  val size : 'a t -> int
  val is_empty : 'a t -> bool
  val push : 'a -> 'a t -> 'a t
  val peek : 'a t -> 'a
  val pop : 'a t -> 'a t
  val pp : (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a t -> unit
end

module ListStack: StackSig = struct
  type 'a t = 'a list
  exception Empty

  let empty = []

  let size = List.length

  let is_empty = function
    [] -> true
    | _ -> false

  let push x st =  x :: st

  let peek = function
    [] -> raise Empty
    | h :: _ -> h

  let pop = function
    [] -> raise Empty
    | _ :: t -> t

  let pp pp_val fmt s = 
    let open Format in 
    let pp_break fmt () = fprintf fmt "@," in
    fprintf fmt "@[<v 0>top of stack";
    if s <> [] then fprintf fmt "@,";
    pp_print_list ~pp_sep:pp_break pp_val fmt s;
    fprintf fmt "@,bottom of stack"
end

module ListStackCachedSize: StackSig = struct
  type 'a t = 'a list * int
  exception Empty

  let empty = ([], 0)

  let size (_, sz) =  sz

  let is_empty (_, sz) = sz = 0

  let push x (st, sz) = (x :: st, sz + 1)

  let peek (st, _) =
    match st with
    [] -> raise Empty
    | h :: _ -> h

  let pop (st, sz) = 
    match st with
    [] -> raise Empty
    | _ :: t -> (t, sz - 1)

  let pp pp_val fmt s = ()
end