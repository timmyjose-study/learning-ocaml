let aliasing_demo () =
  let x = ref 42 in
  let y = ref 42 in
  let z = x in (* aliasing *)
  (x := 43;
  assert (!z = 43);
  assert (!x = 43);
  assert (!y = 42))

let next_val = 
  let counter = ref 0 in
  fun () ->
    incr counter;
    !counter

(* recursion without using `rec`   tying the recursive knot*)

let fact0 = ref (Fun.id)

let fact n = if n = 0 then 1 else n * !fact0 (n - 1)

let () = fact0 := fact


