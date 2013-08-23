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

mydog = Dog.new
yourdog = Dog.new

mydog.set_name('slut')
yourdog.set_name('whore')
puts mydog.get_name()
puts mydog.talk()