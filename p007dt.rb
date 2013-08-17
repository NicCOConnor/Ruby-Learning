#p007dt.rb

#Dealing with Extreamly large numbers

# Ruby is dynamic
rice_on_square = 1
64.times do |square|
   puts "On square #{square + 1} are #{rice_on_square} grains(s)"
   rice_on_square *= 2
end

#examples of type dynamics
s = 'hello'
puts s.class

puts 'I am in class = ' + self.class.to_s
puts 'I am an object = ' + self.to_s
print 'The object methods are = '
puts self.private_methods.sort

#one more example
5.times { puts "Mice!\n"} #More on blocks later
  "Elephants Like Peanuts".length

