type 'a node = { value : 'a ; next : 'a mlist }
and 'a mlist = 'a node option ref

let empty () : 'a mlist = ref None

let insert_first (lst : 'a mlist) (v : 'a) : unit =
  lst := Some { value = v ; next = ref !lst  }

let rec to_list (lst : 'a mlist) : 'a list =
  match !lst with None -> [] | Some { value ; next } -> value :: to_list next

let l : int mlist = empty ()

let () = 
  (
    insert_first l 100 ;
    insert_first l 200 ;
    insert_first l 300 ;
    insert_first l 400 ;
    insert_first l 600 ;
    insert_first l 600 ;
)