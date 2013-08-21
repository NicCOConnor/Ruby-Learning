#Demonstrating class inheritance
class Mammal
  def breathe
    puts 'inhale and exhale'
  end
end

#Cat Class
class Cat < Mammal
  def speak
    puts 'Meow'
  end
end

#Dog Class
class Dog < Mammal
  def speak
    puts 'Rough Rough'
  end
end

cheeto = Cat.new()
rylie = Cat.new()
kia = Dog.new()

cheeto.breathe()
cheeto.speak()

rylie.breathe()
rylie.speak

kia.breathe()
kia.speak

class Bird
  def preen
    puts "I am cleaning my feathers."
  end
  def fly
    puts "I am flying"
  end
end

class Penguin < Bird
  def fly
    puts "Sorry. I'd rather swim"
  end
end

p = Penguin.new()
p.preen()
p.fly()

b = Bird.new()
b.preen()
b.fly()









