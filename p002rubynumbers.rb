#p002rubynumbers.rb
=begin
  Ruby Numbers
  Usual Operators:
  + Addition
  - Subtraction
  * Multiplication
  / Division
=end

puts 1+2
puts 2*3
#integer division
#When you do arithmatic with integers, you'll get integer answers
puts 3/2
puts 10-11
puts 1.5/2.6

#Modulus Operator
puts (5 % 3)
puts (-5 % 3)
puts (5 % -3)
puts (-5 % -3)

# Difference Between or and ||
puts nil || 2013
puts false || 2013
puts "ruby" || 2013

#Assigning Value with OR for defaults 
  #The Long Way
@variable = @variable || "Default Value"

puts @variable
#wont set following variable unless nil
@variable = nil

  #The Shortcut
@variable ||= "Another Default"

puts @variable

#going to write a complex expression
def g *args   #The Splat here says I accept 1 or more arguments, in the form of an array
  args        #This returns an array
end

def f arg
   arg
end

x,y,z = [true,'two',false]  #parrallel assignments lets us do this
if a = f(x) and b=f(y) and c=f(z) then 
  d = g(a,b,c)  #An array is returned, and stored in variable d
end

p d #using p to puts and inspect d
