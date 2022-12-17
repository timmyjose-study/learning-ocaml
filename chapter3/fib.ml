(* fib.nl *)

let n = try int_of_string Sys.argv.(1) with _ -> 1

let rec fib n = 
  if n < 0 
  then 0
  else 
    match n with 
    0 -> 0
    | 1 -> 1
    |_ ->  fib (n - 1) + fib (n - 2)

let main () = 
  let r = fib n in
  Printf.printf "fib(%d) = %d\n" n r

let _ =  main ()
