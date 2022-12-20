module type X = sig
  val x : int
end

module IncX (M : X) = struct
  let x = M.x + 1
end

module Inc10 = IncX (struct let x = 10 end)

module AddX (M : X) = struct
  let add y = M.x + y
end

module Add5 = AddX (struct let x = 5 end)

module type Add = sig
  val add : int -> int
end

module CheckAddX : X -> Add = AddX

module CheckAdd200 = CheckAddX (struct let x = 200 end)