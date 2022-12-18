type nat = Zero | Succ of nat

let rec nat_of_int = function
  | 0 -> Zero
  | n -> Succ (nat_of_int (n - 1))

let rec int_of_nat = function
  | Zero -> 0
  | Succ n -> 1 + int_of_nat n

let is_zero = function
  | Zero -> true
  | _ -> false

let pred = function
  | Zero -> failwith "pred Zero is undefined"
  | Succ n -> n

let rec add n1 = function
  | Zero -> n1
  | Succ n2 -> Succ (add n1 n2)

let rec even = function
  | Zero -> true
  | Succ n -> odd n
and odd = function
  | Zero -> false
  | Succ m -> even m