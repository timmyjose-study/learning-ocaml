let rec sum lst =
  match lst with
  [] -> 0
  | h :: t -> h + sum t

let rec length lst = 
  match lst with
  [] -> 0
  | _ :: t -> 1 + length t

let rec append lst1 lst2 = 
  match lst1 with
  [] -> lst2
  | h :: t -> h :: append t lst2

let empty lst = lst = []

let rec inc_first lst = 
  match lst with
  [] -> []
  | h :: t -> h + 1 :: t
