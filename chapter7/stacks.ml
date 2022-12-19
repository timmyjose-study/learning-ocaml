module type StackSig = sig
  type 'a stack_t
  exception Empty

  val empty: 'a stack_t
  val is_empty : 'a stack_t -> bool
  val push : 'a -> 'a stack_t -> 'a stack_t
  val peek : 'a stack_t -> 'a
  val pop : 'a stack_t -> 'a stack_t
end

module Stack: StackSig = struct
  type 'a stack_t = 'a list
  exception Empty

  let empty = []

  let is_empty st = List.length st = 0

  let push x st = x :: st

  let peek = function 
    [] -> raise Empty
    | h :: _ -> h

  let pop = function
    [] -> raise Empty
    | _ :: t -> t
end

let s1 = Stack.(empty |> push 1 |> push 2 |> push 3 |> push 4 |> push 5)
let s2 = Stack.(empty |> push "hello" |> push "world" |> push "ciao!")
