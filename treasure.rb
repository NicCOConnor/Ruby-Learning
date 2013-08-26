class Thing
  @@num_things = 0  #class variable
  
  attr_reader(:description)
  attr_writer(:name, :description)
  
  def initialize(aName, aDescription)
    @name           = aName
    @description    = aDescription
    @@num_things    +=1
  end
  
  #Override to_s
  def to_s
    return "(Thing.to_s):: The #{@name} Thing is #{@description}"
  end
  
  def show_classvars
    return "There are #{@@num_things} Thing objects in this game"
  end
  #Get Name variable/attribute
  def name
    return @name.capitalize
  end
end

class Room < Thing
  #TODO: Add Room-Specific behavior here ...
end

class Treasure < Thing    #Treasure descends from Thing
  attr_accessor :value
  
  def initialize(aName, aDescription, aValue)
    super(aName, aDescription)
    @value = aValue
  end
end

#Map
class Map
  #@rooms will be an array - an ordered list
  #of room objects
  @@num_rooms = 0
  
  def initialize(someRooms)
    @rooms = someRooms
    @@num_rooms += someRooms.count
  end
  #The to_s method iterates over all the Room objects in @rooms
  #and prints information on each. We'll come back to look at the 
  #implementation of this method later on
  def to_s
    @rooms.each {
      |a_room|
      puts(a_room)
    }
  end
  def show_classvars
    return "There are #{@@num_rooms} rooms"
  end
end

#This is where are Program starts
#   i) Treasures
t1 = Treasure.new("Sword","an Elvish weapon forged of gold", 800)
t2 = Treasure.new("Dragon Horde","a huge pile of jewels", 550)
#   ii) Rooms
room1 = Room.new("Crystal Grotto","A Glittery Cavern")
room2 = Room.new("Dark Cave","A Gloomy hole in the rocks")
room3 = Room.new("Forest Glade","A verdant clearing filled with shimmering light")
#   iii) a Map - Which is an array containing the Rooms just created
mymap = Map.new([room1,room2,room3])
puts "\nLet's inspect the treasures..."
puts "This is treasure1: #{t1.inspect}"
puts "This is treasure2: #{t2.inspect}"
puts "\nLet's try out the Thing.to_s method"
puts "Yup treasure 2 is #{t2.to_s}"
puts "\nNow let's see how our attribute accessors work"
puts "We'll evaluate this:"
puts 't1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}' # Non-Evaluated
puts "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}" #"" Evaluates variables
t1.value = 100
t1.description << " (Now somewhat tarnished)" #note << appends specified string to existing string
puts "t1 (NOW) name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
puts "\nLet's take a look at room1..."
puts "room1 name=#{room1.name}, description=#{room1.description}"
puts "\nAnd the map..."
puts "mymap = #{mymap.to_s}"
puts "\nLet's check how many Thing objects we've created..."
puts (t1.show_classvars)
puts "\nFinally, Let's check how many rooms our map has..."
puts (mymap.show_classvars)
 


