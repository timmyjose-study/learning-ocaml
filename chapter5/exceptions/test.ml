open OUnit2

let tests = "test suite for List.hd" >::: [
  "empty" >:: (fun _ -> assert_raises (Failure "hd") (fun () -> List.hd []));
  "singleton" >:: (fun _ -> assert_equal 1 (List.hd [1]));
  "multiple" >:: (fun _ -> assert_equal 1 (List.hd [1; 2; 3; 4; 5]));
]

let _ = run_test_tt_main tests