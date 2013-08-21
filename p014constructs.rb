#p014constructs.rb
#In Ruby, nil and false evaluate to false
#everything else(including true, 0) means true
#nil is an actual object
#if else end
var = 4
if var > 4
  puts "Variable is greater then 4"
  puts "I can have multiple statements here"
  if var == 5
    puts "Nested if else possible"
  else
    puts "Too Cool"
  end
else
  puts "Variable is not greater then 5"
  puts "I can have multiple statements here"
end 
