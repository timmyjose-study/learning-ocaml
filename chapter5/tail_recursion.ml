let rec sum (l: int list): int = 
  match l with
  [] -> 0
  | h :: t -> h + sum t

let sum_tr (l: int list): int = 
  let rec sum_tr_aux l acc = 
    match l with
    [] -> acc
  | h :: t -> sum_tr_aux t (acc + h)
  in
    sum_tr_aux l 0

let from i j l = 
  let rec from_aux i j acc = 
    if j < i
    then  acc 
    else  from_aux i (j - 1) (j :: acc)
  in
    from_aux i j l

let ( --  ) i j = from i j []

let long_list = 1 -- 1_000_000

let ( => ) i j = List.init (j - i + 1) Fun.id
