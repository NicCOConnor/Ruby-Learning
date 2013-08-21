#p013strcmp.rb
#String#eql?, tests two strings for identical content
#it returns the same result as ==
#string#equal?, test whether two strings are the same object

s1 = 'Nic'
s2 = 'Nic'
s3=s1

def message(msg)
  puts "#{msg}"
end

if s1 == s2
  message("Both string have identical content")
else
  message("Both string do not have identical content")
end
if s1.eql?(s2)
  message("Both string have identical content")
else
    message("Both string do not have identical content")
end

if s1.equal?(s2)
  message("Both string are identical objects")
else
  message("Both string are not identical objects")
end

if s1.equal?(s3)
  message("Both string are identical objects")
else
  message("Both string are not identical objects")
end

#using %w for arrays
names1 = ['ann', 'richard', 'william','susan','pat']
puts names1[0]  #ann
puts names1[3]  #susan
#this is the same
names2 = %w{ann richard william susan pat}
puts names2[0] #ann
puts names2[3]  #susan


