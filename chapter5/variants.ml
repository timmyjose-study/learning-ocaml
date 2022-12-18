type day = 
  Sunday 
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday

let int_of_day d = 
  match d with
  | Sunday -> 1
  | Monday -> 2
  | Tuesday -> 3
  | Wednesday -> 4
  | Thursday -> 5
  | Friday -> 6
  | Saturday -> 7

(* beware of silent shadowing of type constructors *)

type ptype = 
  TNormal | TFire | TWater

type peff = 
  ENormal | ENotVery | ESuper