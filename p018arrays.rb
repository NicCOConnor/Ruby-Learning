# p018arrays.rb
#Arrays

#empty Array
var1 = []

#Array index starts from 0
puts var1[0]

# An Array holding a single number
var2 = [5]
puts var2[0]

#An Array holding two strings
var3 = ['Hello', 'Goodnight']
puts var3[0]
puts var3[1]

flavour = 'mango'
#an array whose elements are pointing 
#to three objects - a float, a string and an array
var4 = [80.5, flavour, [true, false]]
puts var4[2]

#A trailing comma is ignored
name = ['Nic', 'Chrissy', 'Ruby', 'Java',]
puts name[0]
puts name[1]
puts name[2]
puts name[3]
#The next one outputs nil
#nil is Ruby's way of saying nothing
puts name[4]
name[4] = 'Pune'
puts name[4]
#We can add ANYTHING
name[5] = 4.33
puts name[5]
#We can even add an array to an array element
name[6] = [1,2,3]

#Some methods on array's
newarr = [45,23,1,90]
puts newarr.sort()
puts newarr.length()
puts newarr.first()
puts newarr.last()

#method each (iterator) - extracts each element into loc
#do end is a block of code
#we shall talk about blocks soon here - 
#http://rubylearning.com/satishtalim/ruby_blocks_and_procs.html
#variable loc refers to each item in the array as it goes through the loop
locations = ['Pune', 'Mumbai', 'Bangalore']
  
locations.each do |loc|
  puts 'I love ' + loc +'!'
  puts "Don't you?"
end

#delete an entry in the middle and shift the remaining entries
locations.delete('Mumbai')
locations.each do |loc|
  puts 'I Love ' + loc + '!'
  puts "Don't you?"
end




    