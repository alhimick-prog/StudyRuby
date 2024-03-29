#cat.rb
#It's just testing how class and object work.

class Cat
  @@all_bites_counter = 0

  def initialize(cat_name)
    @cat_name = cat_name
    @bites_counter = 0
  end

  def who
    "It's cat, whose named is #{@cat_name}"
  end

  def meow
    'Meow-meow'
  end

  def bite
    @bites_counter += 1
    @@all_bites_counter += 1
    "Cat #{@cat_name} bite you! Bites received: #{@bites_counter}"
  end

  def self.all_bites
    "All bites: #{@@all_bites_counter}"
  end
end

cat0 = Cat.new('Barsik')
puts cat0.who
puts cat0.meow
puts cat0.bite
cat1 = Cat.new('Cat1')
10.times { puts cat1.bite }
puts Cat.all_bites