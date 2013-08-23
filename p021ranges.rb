#p021ranges.rb
=begin
  Sequences have a start point, an end point, and a way to
produce successive values in the sequence
In Ruby, sequences are created using the ".." and "..."
range operators
the two dot form creates an inclusive range
the three-dot form creates a range that excludes the specified
high value
 the sequence 1..100000 is held as a Range object

=end

digits = -1..9
puts digits.include?(5)
puts digits.min
puts digits.max
puts digits.reject {|i| i < 5}
  