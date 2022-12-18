let double x = x + x
let square x = x * x

let quad x = double (double x)
let fourth x = square (square x)

let twice f x = f (f x)

let quad = twice double 
let fourth = twice square

let apply (f : 'a -> 'a) (x: 'a) : 'a = f x

let peiplein (x: 'a) (f : 'a -> 'a) : 'a = f x
let ( >| ) = peiplein

let compose (f: 'b -> 'c) (g: 'a -> 'b): 'a -> 'c = fun x -> f (g x)

let double_then_square = compose square double
let square_then_double = compose double square

let both (f : 'a -> 'b) (g : 'a -> 'c) : 'a -> 'b * 'c = fun x -> (f x, g x)

let square_and_double = both square double
let double_and_square = both double square

let cond (p : 'a -> bool) (f : 'a -> 'b) (g : 'a -> 'b) : 'a -> 'b = 
  fun x -> if p x then f x else g x

let rec add1 = function
  | [] -> []
  | h :: t -> h + 1 :: add1 t

let rec concat_bang = function
  | [] -> []
  | h :: t -> (h ^ "!") :: concat_bang t

let rec map (f : 'a -> 'b) (l : 'a list) : 'b list =
  match l with
  [] -> []
  | h :: t -> f h :: map f t

let add1' = map (fun x -> x + 1) 
let concat_bang' = map (fun s -> s ^ "!")

(* Ocaml has right to left evaluation order - metters when there are side effects*)

let rec map f l = 
  match l with 
  [] -> []
  | h :: t ->
      let h' = f h in
      h' :: map f t

let range f t = 
  let rec range_aux f t acc = 
    if t < f
    then acc
    else range_aux f (t - 1) (t :: acc)
  in
    range_aux f t []

let even n = n mod 2 = 0

let rec evens = function
  | [] -> []
  | h :: t -> if even h then h :: evens t else evens t

let odd n = n mod 2 <> 0

let rec odds = function
  | [] -> []
  | h :: t -> if odd h then h :: odds t else odds t

let rec filter p l = 
  match l with
  [] -> []
  | h :: t -> 
      if p h 
      then h :: filter p t
      else filter p t

let evens = filter even
let odds = filter odd

let rec combine op init = function
  | [] -> init
  | h :: t -> op h (combine op init t)

let sum = combine ( + ) 0
let concat = combine ( ^ ) ""

let rec fold_right f lst acc = 
  match lst with
  [] -> acc
  | h :: t -> f h (fold_right f t acc)

let sum ls = fold_right ( + ) ls 0
let concat ls = fold_right ( ^ ) ls ""

let rec fold_left f lst acc = 
  match lst with
  [] -> acc
  | h :: t -> fold_left f t (f acc h)

let sum ls = fold_left ( + ) ls 0
let concat ls = fold_left ( ^ ) ls ""
