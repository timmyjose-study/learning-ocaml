type ptype = 
  TNormal
  | TFire
  | TWater

type mon = {
  name: string;
  hp: int;
  ptype: ptype;
}

let charmander = {
  name = "Charmander";
  hp = 39;
  ptype = TFire;
}

let charizard = {
  charmander with
  name = "Charizard";
  ptype = TWater
}

let get_hp m = match m with { name = n; hp = h; ptype = p } -> h

(* silently overrides/shadows previous definition - watch out! *)
let get_hp m = match m with { name = _; hp = h; ptype = _ } -> h

let get_hp m = match m with { name; hp; ptype } -> hp

let get_hp m = m.hp

let thrd t = match t with (x, y, z) -> z

let thrd t = 
  let x, y, z = t in
  t

let thrd (x, y, z) = z

let thrd (_, _, z) = z