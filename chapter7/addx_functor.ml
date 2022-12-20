module type X = sig
  val x : int
end

module AddX (M : X) = struct
  let add y = M.x + y
end

module A = struct
  let x = 10
end

module B = AddX (A)

let () = assert (B.add 20 = 30)

module Add123 = AddX (struct let x = 123 end)

let () = assert (Add123.add 10 = 133)