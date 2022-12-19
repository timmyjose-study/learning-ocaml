module type X = sig
  val x: int
end

module type T = sig
  module Inner : X
end

module M : T = struct
  module Inner : X = struct
    let x = 42
  end
end