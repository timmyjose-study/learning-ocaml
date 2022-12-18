let rec list_max l = 
  match l with
  [] -> None
  | h :: t -> 
      match list_max t with
      None -> Some h
      | Some mx -> Some (max h mx)

