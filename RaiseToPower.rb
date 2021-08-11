#RaiseToPower.rb
#This program is designed to raise numbers to large powers faster than standard multiplication.
#(This is the practice of solving problems in ruby from the book 
#Essential Algorithms: A Practical Approach to Computer Algorithms, Rod Stevens)

def exponentiation(numb, exp, numb_counter, exp_counter, numb_accum)
  if exp.zero?
    numb_accum
  elsif (exp_counter * 2) <= exp
    numb_counter = numb_counter ** 2
    exp_counter = exp_counter * 2
    exponentiation(numb, exp, numb_counter, exp_counter, numb_accum)
  else
    exp = exp - exp_counter
    numb_accum = numb_accum * numb_counter
    exponentiation(numb, exp, numb, 1, numb_accum)
  end
end

if !(ARGV.size == 2)
  fail 'Incorrect input. Enter any positive number and positive integer exponent.'
end
fail 'Number is equal 0, 0 in any exponent are 0' if ARGV[0].to_f.zero?
fail 'Number is equal 1, 1 in any exponent are 1' if ARGV[0].to_f == 1.0
if ARGV[1].to_i < 1
  fail 'Exponent less than 1. Sorry, but this program is designed to raise to positive integer exponents.'
end
puts exponentiation(ARGV[0].to_f, ARGV[1].to_i, ARGV[0].to_f, 1, 1).to_f