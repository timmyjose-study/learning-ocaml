type point = float * float

type shape = 
  Point of point
  | Circle of point * float
  | Rect of point * point

let area = function
  | Point _ -> 0.0
  | Circle (_, r) -> Float.pi *. r *. r
  | Rect ((x1, y1), (x2, y2)) ->
      let w = x2 -. x1 in
      let h = y2 -. y1 in
      w *. h

let centre = function
  | Point p -> p
  | Circle (p, _) -> p
  | Rect ((x1, y1), (x2, y2)) ->
      let x = (x1 +. x2) /. 2. in
      let y = (y1 +. y2) /. 2. in
      (x, y)

type string_or_int = 
  String of string 
  | Int of int

type string_or_int_list = string_or_int list

let rec sum : string_or_int list -> int = function
  | [] -> 0
  | String s :: t -> int_of_string s + sum t
  | Int n :: t -> n + sum t

let sil = [Int 1; String "2"; Int 3; String "4"; Int 5] 

type t = Left of int | Right of int

let x = Left 1

let double_right = function
  | Left n -> Left n
  | Right m -> Right (2 * m)

type colour = Blue | Red | Green

let string_of_colour = function
  | Blue -> "Blue"
  | Red -> "Red"
  | Green -> "Green"

(* Recursive variants *)

type intlist = Nil | Cons of int * intlist

let lst3 = Cons (3, Nil)
let lst123 = Cons (1, Cons (2, Cons (3, Nil)))

let rec sum : intlist -> int = function
  | Nil -> 0
  | Cons (x, xs) -> x + sum xs

let rec length : intlist -> int = function
  | Nil -> 0
  | Cons (_, xs) -> 1 + length xs

let empty : intlist -> bool = function
  | Nil -> true
  | _ -> false

(* mutually recursive variants *)

type node = { value: int ; next: mylist  }
and mylist = Nil | Node of node

(* parameterized types *)

type 'a mylist = Nil | Cons of 'a * 'a mylist

let lst3 = Cons (3, Nil)
let lst123 = Cons (1, Cons (2, Cons (3, Nil)))

let rec length : 'a mylist -> int = function
  | Nil -> 0
  | Cons (_, xs) -> 1 + length xs

let rec empty : 'a mylist -> bool = function
  | Nil -> true
  | _ -> false

(* multiple type parameters *)

type ('a, 'b) pair = { first: 'a; second: 'b }

let x = { first = 2; second = "hello" }

let myfst p = p.first
let mysnd p = p.second

type fin_or_inf = Fin of int | Inf

let f = function
  | 0 -> Inf
  | 1 -> Fin 1
  | n -> Fin (-n)
