#p015elsifex.rb
#elseif example

#Original Example
puts "Hello, what's your name?"
STDOUT.flush()
name = gets.chomp()
puts 'Hello, ' + name + '.'

if name == 'Nic'
  puts 'What a nice name!!'
else
  if name == 'Chrissy'
    puts 'Another nice name'
  end
end

#modified example with elseif
puts "Hello, What's your name?"
STDOUT.flush()
name = gets.chomp()
puts 'Hello, ' + name + '.'

if name == 'Nic'
  puts 'What a nice name'
elsif name == 'Chrissy'
  puts 'Another nice name'
end

#Further MOdified with || operator
puts "Hello, What's your name?"
STDOUT.flush()
name = gets.chomp()
puts 'Hello, ' + name + '.'
# || is the logical "OR" operator
if name == 'Nic' || name == 'Chrissy'
  puts 'What a nice Name!!'
end

  