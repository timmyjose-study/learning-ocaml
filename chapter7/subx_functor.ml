module type X = sig
  val x : int
end

(*
module SubX (M : X) = struct
  let sub y = y - M.x
end
*)

(* same as above *)
module SubX = functor (M : X) ->
  struct
    let sub y = y - M.x
  end

module Sub10 = SubX (struct let x = 10 end)