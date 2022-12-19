module type MyMathSig = sig
  val fact : int -> int
end

module MyMath: MyMathSig = struct
  (* this is now hidden from clients *)
  let rec fact_aux n acc = 
    if n = 0
    then acc
    else fact_aux (n - 1) (acc * n)

  let fact n = 
    fact_aux n 1
end