#You can provide parameters to the call yield:
#these will be passed to the block
def call_block
  yield('hello', 99)
end
call_block {|str, num| puts str + ' ' + num.to_s}
  
#Returning a value
def try
  if block_given?
    yield
  else
    puts "no block"
  end
end
try #no block
try { puts "hello"} #hello
try do puts "hello" end #hello

 
#Block variables When the same variable is defined inside the block
x = 10
5.times do |x|
  puts "x inside the block: #{x}"
end

puts "x outside the block #{x}"
  