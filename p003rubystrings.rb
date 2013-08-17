#p003rubystrings.rb
=begin
  Ruby Strings
  In Ruby, strings are mutable
=end
puts "Hello World"
# Can use " or ' for strings but ' is more efficient
puts 'Hello World'
#String Concatination
puts 'I Like' + 'Ruby'
#Escape Sequences
puts 'It\'s my Ruby'
#New Here Display's the string 3 times
puts 'Hello' * 3
# defining a constant 
# More on Constants later, here
#http://rubylearning.com/satishtalim/ruby_names.html
PI = 3.1416
puts PI  

#defining a local variable
my_string = 'I Love My City, Pune'
puts my_string
=begin
  Conversions
  .to_i, .to_f, .to_s
=end
var1 = 5;
var2 = '2'
puts var1 + var2.to_i
#<<appending to a string
a = 'hello '
a<<'world.
I Love this world...'

puts a
=begin
  << Marks the start of the string literal and 
  is followed by a delimeter of your choice
  The String literal then starts from the next 
  new line and finishes when the delimeter is 
  repeated again on a line on it's own. This is known as
  Here document syntax
=end
a = <<END_STR
  This is the string
  and a second line 
END_STR

puts a
