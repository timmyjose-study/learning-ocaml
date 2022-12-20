(* simulating the ref type *)

type 'a box = { mutable contents: 'a }

let box (x : 'a) : 'a box = { contents  = x }

let deref (b : 'a box) : 'a = 
  b.contents

let ( ! ) = deref

let assign (b : 'a box) (v : 'a) : unit = 
  b.contents <- v

let ( := ) = assign