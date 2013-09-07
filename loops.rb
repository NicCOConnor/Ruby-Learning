#For loops
for i in [1,2,3] do
  puts i
end
#The For loop is more like the for each loop in other languages

#Same loop written with the each iterator
[1,2,3].each do |i|
  puts i
end

#Not much difference check out these examples
#Example 1
for s in ['one', 'two', 'three'] do
  puts(s)
end

['one', 'two','three'].each do |s|
  puts(s)
end

#Example 2
for x in [1,"two",[3,4,5]] do puts(x) end
[1,"two",[3,4,5]].each do |x| puts(x) end
  
#The Do word can be ommited in multiline statements but cannot on single line statements
 for s in ['one','two','three']
   puts(s)
 end
 
 #In Case you like the old way
 for i in (1..10) do
   puts(i)
 end
 
 #the ruby way with ranges
 for s in 1..3
   puts(s)
 end
 
 (1..3).each do |s|
   puts(s)
 end
 
 #Multiple Iterator arguments
 #Here multiarr is an array containing two 'rows'
 #Sub-Arrays at index 0 and 1
 multiarr = [ ['one','two','three','four'],
              [1,2,3,4] ]
              
#This for loop runs twice (Once for each 'row' of multiarr
for (a,b,c,d) in multiarr
  print("a=#{a}, b=#{b}, c=#{c}, d=#{d}\n")
end

#Same array using each
multiarr.each do |a,b,c,d|
  print("a=#{a}, b=#{b}, c=#{c}, d=#{d}\n")
end

#You can use {} in leu of do, end keywords
[[1,2,3],[4,5,6],[7,8,9]].each{
  |a,b,c|
  puts("#{a}, #{b}, #{c}")
}

#while Loops 
$hours_asleep = 0
def tired
  if $hours_asleep >= 8 then
    $hours_asleep = 0
    return false
  else
    $hours_asleep += 1
    return true
  end
end

def snore
  puts('snore...')
end

def sleep
  puts("z" * $hours_asleep)
end

while tired do sleep end #a single line while loop

while tired
  sleep
end                     #Multiline while loop 

sleep while tired       #Single line modifier, Really like this one. 

begin
  sleep
  snore
end while tired       #multiline while modifier, This code will always run at least once

x = 100
#The code in this loop will never run
while(x<100) do puts('x < 100') end

#The code in this loop never runs




 
 
 