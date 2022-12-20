module type MutStackSig = sig
  type 'a t
  exception Empty

  val empty : unit -> 'a t
  val push : 'a -> 'a t -> unit
  val peek : 'a t -> 'a
  val pop : 'a t -> unit
end

module MutStack : MutStackSig = struct
  type 'a node =  { value : 'a ; mutable next : 'a node option }

  type 'a t = { mutable top : 'a node option }

  exception Empty

  let empty () = { top = None }

  let push x st = 
    st.top <- Some { value = x ; next = st.top }

  let peek st = 
    match st.top with
    None -> raise Empty
    | Some  { value  } -> value

  let pop st = 
    match st.top with
    None -> raise Empty
    | Some { next } ->  st .top <- next
end