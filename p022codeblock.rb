=begin
Ruby code blocks are chunks of code between braces or 
between do-end the you can associate with method invokations 
=end
def call_block
  puts 'Start of method'
  yield
  yield
  puts 'End of Method'
end
call_block {puts 'In the block'}