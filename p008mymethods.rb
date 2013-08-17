#p008mymethods.rb
# A method returns the value of the last line
#Methods that act as queries are often named with a trailing ?
# Methods that are "dangerous," or modify the receiver, might be named
# with a trailing ! (Bang methods)

#A Simple Method
def hello
  'Hello'
end
#use the method
puts hello

#method with an argument -1
def hello1(name)
  'Hello ' + name
end
puts hello1('Nic')

#method with an Argument -2
def hello2 name2
  'Hello ' + name2
end
puts(hello2 'Asshole')
