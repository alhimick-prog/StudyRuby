# catch_throw_test.rb

def catch_throw(show_text, variable)
  puts show_text
  variable = gets.chomp
  throw :quit_sequence if variable == '!'
end

catch :quit_sequence do
  name, age, answer = nil
  catch_throw('Name: ', name)
  age = catch_throw('Age: ', age)
  answer = catch_throw('Y/N: ', answer)
  puts 'All questions hawe answers.'
ensure
  puts 'Questionnaire is over.'
end
