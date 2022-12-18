open OUnit2
open Day

let make_next_weekday_test name expected input = 
  name >:: (fun _ -> assert_equal expected (next_weekday input) ~printer:string_of_day)


let tests = "test suite for next_weekday" >::: [
  make_next_weekday_test "mon_after_sun" Monday Sunday ;
  make_next_weekday_test "tue_after_mon" Tuesday  Monday ;
  make_next_weekday_test "wed_after_tue" Wednesday  Tuesday;
  make_next_weekday_test "thu_after_wed" Thursday  Wednesday;
  make_next_weekday_test "fri_after_thu" Friday  Thursday;
  make_next_weekday_test "sat_after_fri" Saturday  Friday;
  make_next_weekday_test "sun_after_sat" Sunday  Saturday;
]


let _ = run_test_tt_main tests
