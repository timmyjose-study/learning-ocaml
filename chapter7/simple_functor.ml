module type X = sig
  val x : int
end

(* a functor paraetereized on module M of type X *)
module IncX (M : X) = struct
  let x = M.x + 1
end

module A = struct 
  let x = 0 
end

(* since functors are essentially "functions", we need to apply them, and the result is a module *)
module B = IncX (A)

let () = assert (B.x = 1)

module C = IncX (B)

let () = assert (C.x = 2)