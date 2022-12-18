let d = [("rectangle", 4); ("nonagon", 9); ("icosagon", 20)]

let insert k v l = 
  (k, v) :: l

let rec lookup k l = 
  match l with
  [] -> None
  | (kk, vv) :: t ->
      if k = kk
      then Some vv
      else lookup k t