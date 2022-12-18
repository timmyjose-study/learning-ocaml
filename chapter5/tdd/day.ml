type day = 
  Sunday 
  | Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday

let string_of_day d = 
  match d with
  Sunday -> "Sunday"
  | Monday -> "Monday"
  | Tuesday -> "Tuesday"
  | Wednesday -> "Wednesday"
  | Thursday -> "Thursday"
  | Friday -> "Friday"
  | Saturday -> "Saturday"

let next_weekday d = 
  match d with
  Sunday -> Monday
  | Monday -> Tuesday
  | Tuesday -> Wednesday
  | Wednesday -> Thursday
  | Thursday -> Friday
  | Friday -> Saturday
  | Saturday -> Sunday