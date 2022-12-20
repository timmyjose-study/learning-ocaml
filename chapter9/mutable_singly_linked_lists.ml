type 'a node = { value : 'a ; mutable next : 'a node option }

type 'a mlist = {
  mutable first : 'a node option
}

let empty () : 'a mlist = { first = None }

let insert_first (lst : 'a mlist) (v : 'a) : unit = 
  lst.first <- Some {  value = v ; next = lst.first } 

let rec to_list (lst : 'a mlist) : 'a list = 
  let rec to_list_aux = function
    None -> []
    | Some { value ; next } -> value :: to_list_aux next
  in
  to_list_aux lst.first