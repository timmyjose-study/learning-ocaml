(* mutable values for singly-linked list *)

type 'a node =  { value : 'a ref; next : 'a mlist }
and 'a mlist = 'a node option ref

let empty : 'a mlist = ref None

let insert_first (lst : 'a mlist) (v : 'a) : unit = 
  lst := Some  { value = ref v ; next = ref !lst }

let rec set (lst : 'a mlist) (n : int) (v : 'a) : unit = 
  match !lst, n with
  None, _ -> invalid_arg "out of bounds"
  | Some { value }, 0 -> value := v
  | Some { next }, _ -> set next (n - 1) v

let l : 'a mlist = ref None

let () = 
  for num = 1 to 10 do
    insert_first l num
  done

let rec to_list (lst : 'a mlist) : 'a list = 
  match !lst with None -> [] | Some { value ; next } -> !value :: to_list next
