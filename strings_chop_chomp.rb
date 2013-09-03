#Combining a few of the files here to demonstrate string indexes
#Chop and Chomp functions

#String concatination
 s = "hello world"
 s = s + "!"
 puts s
 
 #Indexing into a string
#replacing a character
s[1] = 'a'
puts s 


s = "Hello World"
puts(s[1])      #Prints 'e'  Example says this prints ACSII 101 could be a change in Ruby 1.9.3
puts(s[1,1])    #Prints 'e' also
puts (s[1,3])   #Prints 'ell'
puts (s[1..3])  #RANGES Also prints 'ell'
puts (s[-1])    #prints 'd' example of negative index starts at the end.
puts (s[-5,1])  #Prints W
puts (s[-5,5])  #Prints 'World'
puts (s[-5..5]) #prints an empty string
puts (s[-5..-1])#prints 'World'
  
#Removing the Newline Characters with Chop and Chomp
#Chop will remove the final character regardless if it's a newline 
#Chomp will only remove newline and return character

s1 = "Hello world
"
s2 = "Hello World"

puts s1.chop()
puts s1.chomp()
puts s2.chop()
puts s2.chomp()

#Chomp will let you specify the newline character(s)
puts s2.chomp('rld')

#Format Strings
#printf can be used to format strings 
# %d - Decimal
# %f - Float Precision can be specified "%0.02f" <-- 2 Decimal places
# %o - Octal
# %p - inspect object
# %s - string
# %x - Hex
printf("%d %0.02f %s %p", 10.123, 3.14159, s2, s2)

#Example of Ranges. 

