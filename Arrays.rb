#Creating an Array
arr = ['one', 'two', 'three', 'four']
  
def hello
  return "hello world"
end
#0 - Example of code as an array value
#1 - Example of a method as an array value
#2 - Example of OS execution as an array value
x = [1+2, hello, `dir`]
x.each {|i| puts i}
  #Array of Directories on local OS
  files = Dir.entries('C:\\')
  puts files
  
  #Easy definition of strings no ,
  y = %W(This is an array of strings)
y.each{|i| puts i}
  
  #Traditionl Array initialization
  a = Array.new() #Empty array
  b = Array.new(2) #Array with 2 nil values 
  c = Array.new(2,"Hello World")
  all_arr = [a,b,c]
  #print all arrays
  all_arr.each do |arr|
    arr.each {|v| puts v}
  end
  
  #Multi-Demensional Arrays
  d = Array.new(2)
  d[0] = Array.new(2,'hello')
  d[1] = Array.new(2, 'world')

  puts d
  
  #Multi-dimensional Example two, it's commong to separate nested arrays in a new line like this.
   e = [  [1,2,3,4],
          [4,6,7,8],
          [9,10,11,12],
          [13,14,15,16] ]
     
puts e

multiarr = [['one', 'two', 'three', 'four'], [1,2,3,4]]
#Iterating the multiarr Show they are arrays and values 
for i in multiarr
  puts (i.inspect)
end
#Iterates through the VALUES of the array
for (a,b,c,d) in multiarr
  print("a=#{a}, b=#{b}, c=#{c}, d=#{d}\n")
end

#Iterates through values of the array of unknown row length
for row in multiarr
  for item in row
    printf("%s ",item)
  end
  printf("\n")
end

#Indexing into arrays
arr = ['h','e','l','l','o','w','o','r','l','d']

print(arr[0,5])
print(arr[-5,5])
print(arr[0..4])
print(arr[-5..-1])
  
#Copying Array
arr1 = %w[h e l l o w o r l d]
arr2 = arr1 #arr2 is now the same as arr1. Change arr1 and arr2 changes too
arr3 = arr1.clone() #arr3 is copied and not changed when arr1 is changed. 
arr1[1] = 'a'
puts
print arr1
print arr2
print arr3

#Testing Arrays for Equality

test1 = [0,10,20]
test2 = [0,20,20]
puts
puts test1 <=> test2 #-1 if left is less then right 0 if both are equal +1 if right is greater then left.

#Sorting Arrays
arr1.sort{
  |a,b|
  a.to_s <=> b.to_s
}
print arr1.sort()

class MyArray < Array
  include Comparable
  
  def <=> (anotherArray)
    self.length() <=> anotherArray.length()
  end
end
puts #Need a newline for readablity

myarr1 = MyArray.new([0,1,2,3,5])
myarr2 = MyArray.new([1,2,3,4,5,6])

puts myarr1 <=> myarr2


  
