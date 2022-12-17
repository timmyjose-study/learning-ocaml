module type MyModuleSig = sig
  val inc : int -> int 
  type colour
  exception Oops
end

module MyModule: MyModuleSig = struct
  let inc x = x + 1
  type colour = Red | Blue | Green
  exception Oops
end

(* we can combine signatures and struct definitions like so *)

module FooBar: sig
  val foo : unit -> unit
  val bar : unit -> unit
end = struct
  let foo () = Printf.printf "Foo!\n"
  let bar () = Printf.printf "Bar!\n"
end