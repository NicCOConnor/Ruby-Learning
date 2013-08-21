#p019mtdarray.rb
# if you give return multiple parameters,
# the method returns them in an array
# The times method of the Integer class iterates block num times,
#passing in values from zero to num-1

def mtdarray
  10.times do |num|
    square = num * num
    return num, square if num > 5
  end
end

#using parallel assignment to collect the return value 
num, square = mtdarray
puts num
puts square

#Parallel Assignment 
a = 1,2,3,4
b = [1,2,3,4]

puts a.to_s + " " + b.to_s

#If the left hand side contains a comma parallel Assignment takes over and 3,4 are dropped
a, b = 1,2
c, = 1,2,3,4

print a, b, c

#Environment variables
ENV.each{|k,v| puts "#{k}: #{v}"}
  
#Modifying environment variables
ENV["course"] = "FORPC101"
puts "#{ENV['course']}"

str = 'hello'
print Array(str).class #array

str ='hello\nworld'
print Array(str)

#What are the ancestors of Array
a = [1,2,3,4]
print a.class.ancestors()

