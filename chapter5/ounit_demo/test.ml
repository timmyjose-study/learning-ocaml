open OUnit2
open Sum

let make_sum_test name expected input = 
  name >:: (fun _ -> assert_equal expected (sum input) ~printer:string_of_int)

let tests = "test suite for sum" >::: [
  make_sum_test "empty" 0 [];
 make_sum_test "singleton" 1 [1];
 make_sum_test "two_elements" 10 [4;6];
]

let _ = run_test_tt_main tests