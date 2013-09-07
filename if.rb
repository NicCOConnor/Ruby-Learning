#simple if then loop
aDay = 'Saturday'

if aDay == 'Saturday' or aDay == 'Sunday'
  dayType = 'Weekend'
else
  dayType = 'Weekday'
end

p(dayType)

 x = 1
if x == 1 then puts('with then') end     #With end

if x == 1 then puts('with colon') end

working_overtime=false
if aDay == 'Saturday' or aDay == 'Sunday' and not working_overtime
  dayType = 'Holiday'
  p("Hurrah!")
else
  dayType = 'Working Day'
end

x = 10
x == 10 ? puts("It's 10") : puts("it's some other number")



input = nil

def showDay(i)
  if i == 1 then p("It's Monday")
  elsif i == 2 then p("It's Tuesday")
  elsif i == 3 then p("It's Wednesday")
  elsif i == 4 then p("It's Thursday")
  elsif i == 5 then p("it's Friday")
  elsif(6..7) === i then p("Yippee! It's the weekend")
  else p("That's not a real day!")
  end
end

showDay(6)
while input != 'q' do
  p("Enter a number between 1 and 1000 (or 'q' to quit)")
  print("?-")
  input = gets().chomp()
  if input == 'q'
    p("Bye")
  elsif input.to_i > 800
    p("That's a hight rate of pay!")
  elsif input.to_i <= 800
    p("We van afford that")
  end
end

