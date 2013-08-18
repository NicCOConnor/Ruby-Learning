#p012mtdstack.rb
#Sequence in which the parameters are put on to the stack is left to right
def mtd(a=99, b=a+1)
  [a,b]
end
puts mtd # Displays 99, 100

# Are the parameters passed by value or by reference 
def downer(string)
  string.downcase
end
a = "HELLO"
downer(a) # -> "hello"
puts a    # -> "HELLO"

def downer(string)
  string.downcase!
end
a = "HELLO"
downer(a) # -> "hello"
puts a    # -> "hello"

