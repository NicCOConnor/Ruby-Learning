#Simple example of an exception
begin
  x = 1/0
rescue Exception
  x = 0
  puts($!.class)
  puts($!)
end

#Instead of using non-descriptive variables you can assign the exception a variable like this
begin
  x = 1/0
rescue Exception => ex
  puts(ex.class)
  puts(ex)
end

#Type Exception errors. Such as trying to divide by a string
def calc(val1, val2)
  begin
    result = val1 / val2
  rescue TypeError, NoMethodError => e
    puts(e.class)
    puts(e)
    puts("One of the values is not a number!")
    result = nil
  rescue Exception => e
    puts(e.class)
    puts(e)
    result = nil
  end
  return result
end

puts(calc(10,20))
puts(calc(100,0))
puts(calc('hello', 20))
puts(calc(20, 'hello'))
