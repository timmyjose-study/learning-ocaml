(* fib_twice.ml *)

let n = try int_of_string Sys.argv.(1) with _ -> 1

let rec fib n = 
  if n < 0 
  then 1
  else
    match n with
    0 -> 0
    | 1 -> 1
    | _ -> fib (n - 1) + fib (n - 2)

let main () = 
  let d1 = Domain.spawn (fun _ -> fib n) in 
  let d2 = Domain.spawn (fun _ -> fib n) in
  let r1 = Domain.join d1 in
  Printf.printf "fib(%d) = %d\n" n r1;
  let r2 = Domain.join d2 in 
  Printf.printf "fib(%d) = %d\n" n r2

let _ = main ()