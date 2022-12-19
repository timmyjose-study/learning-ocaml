type 'a t = 'a list
exception Empty

let empty = []

let is_empty = function
  [] -> true
  | _ -> false

let push x st = x :: st

let peek = function
  [] -> raise Empty
  | h :: _ -> h

let pop = function
  [] -> raise Empty
  | _ :: t -> t