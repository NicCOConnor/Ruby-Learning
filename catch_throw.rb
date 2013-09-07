#Simple Catch Throw example for dividing by zero
catch(:finished) do
  print('Enter a number: ')
  num = gets().chomp().to_i()
  if num == 0 then
    throw :finished #if num is 0, jump out of the block
  end
  #Here there my be hundreds of lines of calculations
  puts("#{100*num}")
  puts("#{100/num}")
  puts("#{100-num}")
  puts("#{100+num}")
end

puts("finished")

#You can have throw outside the block, like this
def doThings(aNum)
  i = 0
  while true
    puts("I'm doing things")
    i += 1
    throw(:go_for_tea) if (i == aNum)
  end
end

catch(:go_for_tea){
  doThings(5)
}


