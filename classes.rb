# Demonstrating a class 

#Dog class has Method for name
class Dog # Must be uppercase first letter
  #Method to Set the Name
  def set_name(aName)
    @myname = aName
  end
  #Method to Get the Name
  def get_name
    return @myname
  end
  #Method to make the dog speak
  def talk
    return 'woof!'
  end
end

class Cat
  #Method to Set the Name
   def set_name(aName)
     @myname = aName
   end
   #Method to Get the Name
   def get_name
     return @myname
   end
   #Method to speak
   def talk
     return 'meow!' 
   end
end
mydog = Dog.new
yourdog = Dog.new
anotherdog = Dog.new
cat1 = Cat.new()
cat2 = Cat.new()
cat1.set_name('Cheeto')
cat2.set_name('Rylie')
mydog.set_name('Kia')
yourdog.set_name('Sasha')


puts "the pets I own are:"
puts cat1.get_name() + " he says " + cat1.talk
puts cat2.get_name() + " he says " + cat2.talk
puts mydog.get_name() + " he says " + mydog.talk
puts yourdog.get_name() + " she says " + yourdog.talk
puts anotherdog.get_name() + " she says " + anotherdog.talk
