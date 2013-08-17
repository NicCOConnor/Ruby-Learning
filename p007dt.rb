#p007dt.rb

#Dealing with Extreamly large numbers

# Ruby is dynamic
rice_on_square = 1
64.times do |square|
   puts "On square #{square + 1} are #{rice_on_square} grains(s)"
   rice_on_square *= 2
end
