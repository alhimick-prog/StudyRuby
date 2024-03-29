#MegaGreeter.rb
#It's another testing how class and object work.

class MegaGreeter
  attr_accessor :names

  def initialize(names = 'World')
    @names = names
  end

  def say_hi
    if @names.nil?
      puts '...'
    elsif @names.respond_to?('each')
        @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{names}!"
    end
  end

  def say_bye
    if @names.nil?
      puts '...'
    elsif @names.respond_to?('join')
      puts "Goodbye #{@names.join(", ")}. Come back soon!"
    else
      puts "Goodbye #{@names}. Come back soon!"
    end
  end
end

 mg = MegaGreeter.new
 mg.say_hi
 mg.say_bye

mg.names = 'Seva'
mg.say_hi
mg.say_bye

mg.names = ['Sano', 'Bob', 'Jack', 'Dave']
mg.say_hi
mg.say_bye

mg.names = nil
mg.say_hi
mg.say_bye