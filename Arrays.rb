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
     
 
  
  
