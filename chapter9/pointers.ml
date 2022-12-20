type 'a pointer = 'a ref option

let null : 'a pointer = None

let malloc (x : 'a) : 'a pointer = Some (ref x)

exception Segfault

let deref (p: 'a pointer) : 'a = 
  match p with
  None -> raise Segfault
  | Some r -> !r

(* Use ~ to indicate a prefix operator *)
let ( ~* ) = deref

let assign (p : 'a pointer) (x : 'a) : unit = 
  match p with
  None -> raise Segfault
  | Some r -> r := x

let ( =* ) = assign

let address (p : 'a pointer) : int = 
  match p with None -> 0 | Some r -> Obj.magic r

let ( ~&  ) = address