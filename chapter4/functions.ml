let rec factorial n = 
  if n <= 0 
  then 1
  else n * factorial (n - 1)

let rec pow x y = 
  if y = 0 
  then 1
  else x * pow x (y - 1)

let rec even n = 
  match n with
  0 -> true
  | _ -> odd (n - 1)
and odd n = 
  match n with
  0 -> false
  | _ -> even (n - 1)

(* pipelining for function application composition *)

let inc x = x + 1
let square x = x * x

let value1 = square (inc 5)
let value2 = 5 |> inc |> square

let () = assert (value1 = value2)

(* polymorpgic functions *)

let id x = x

let f ~par1:arg1 ~par2:arg2 = arg1 + arg2

let g ~arg1 ~arg2 = arg1 - arg2

let h ~n:(n: int) ~m:(m: int): int = n + m

let foo ?n:(n = 100) m = n + m

(* custom operators *)

let ( ^^ ) x y = max x y

(* tail recursion *)

let rec count n = 
  if n = 0 
  then 0
  else 1 + count (n - 1)

let count_tailrec n = 
  let rec count_tailrec_inner n acc = 
    match n with
    0 -> acc
  | _ -> count_tailrec_inner (n - 1) (1 + acc)
  in
    count_tailrec_inner n 0

let factorial_tr n = 
  let rec factorial_aux n acc = 
    match n with 
    0 -> acc
    | _ -> factorial_aux (n - 1) (n * acc)
  in
    factorial_aux n 1