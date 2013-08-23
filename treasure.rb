class Thing
  attr_reader :description
  attr_writer :description
  attr_writer :name
  
  def initialize(aName, aDescription)
    @name           = aName
    @description    = aDescription
  end
  #Get Name variable/attribute
  def name
    return @name.capitalize
  end
end

class Treasure < Thing    #Treasure descends from Thing
  def initialize(aName, aDescription, aValue)
    super(aName, aDescription)
    @value = aValue
  end
  
  def value
    return @value
  end
  
  def value=(aValue)
    @value = aValue
  end
end

#This is where are Program starts
t1 = Treasure.new("Sword","an Elvish weapon forged of gold", 800)
t2 = Treasure.new("Dragon Horde","a huge pile of jewels", 550)
puts "This is treasure1: #{t1.inspect}"
puts "This is treasure2: #{t2.inspect}"
puts "t1 name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
t1.value = 100
t1.description = " (now somewhat tarnished)"
puts "t1 (NOW) name=#{t1.name}, description=#{t1.description}, value=#{t1.value}"
