let rec zfact n = 
  if Z.equal n Z.zero 
  then Z.one
  else 
    let pred = Z.pred n in
    Z.mul n (zfact pred)

let zfact_tr n = 
  let rec zfact_aux n acc = 
    if Z.equal n Z.zero
    then acc
    else zfact_aux (Z.pred n) (Z.mul n acc)
  in
    zfact_aux n Z.one