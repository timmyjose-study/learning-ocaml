(* immediate matches - when pattern matching is done on the last argument of the function *)

let rec sum lst = 
  match lst with
  [] -> 0
  | h :: t -> h + sum t 

(* is the same as *)

let rec sum_function = function
  | [] -> 0
  | h :: t -> h + sum_function t

let xs = [1; 2; 3; 4; 5]

let () = assert (sum xs = sum_function xs)

let rec prod lst = 
  match lst with
  [] -> 1
  | h :: t -> h * prod t

let rec prod_function = function
  | [] -> 1
  | h :: t -> h * prod_function t

let () =  assert (prod xs = prod_function xs)

(* longer example of using immediate matches *)

type nat = Z | Succ of nat

(* nat_of_int : int -> nat *)
let rec nat_of_int = function
    | 0 -> Z
    | n -> Succ (nat_of_int (n - 1))

(* int_of_nat : nat -> int *)
let rec int_of_nat = function
  | Z -> 0
  | Succ n -> 1 + int_of_nat n

let rec nat_add n = function 
  | Z -> n
  | Succ m -> Succ (nat_add n m)

let five_nat = nat_of_int 5
let seven_nat = nat_of_int 7

