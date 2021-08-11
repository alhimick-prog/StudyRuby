#FindFactors.rb
#This program search all prime divisor for number.
#Input number like an argument in command line.
#This is a bad version because it uses recursion and does not work with very large numbers.

def find_factors(numb, i, arr_fact)
  if i <= numb
    if (numb % i).zero?
      numb = numb / i
      arr_fact << i if !(are_in_array?(i, arr_fact))
      arr_fact = find_factors(numb, i, arr_fact)
    else
      i += 1
      arr_fact = find_factors(numb, i, arr_fact)
    end
  else
    if (numb % i).zero?
      arr_fact << numb
    end
  end
  arr_fact
end
def are_in_array?(n, arr_fact)
  in_array = false
  arr_fact.each do |val|
    in_array = true if (n % val).zero?
  end
  in_array
end

fail 'Incorrect input. Enter one number.' if !(ARGV.size == 1)
fail 'Number cannot be less than zero.' if ARGV[0].to_i < 0
fail 'Are you kidding me? You input 0!' if ARGV[0].to_i.zero?
fail 'Are you kidding me? You input 1!' if ARGV[0].to_i == 1
arr_fact = Array.new
arr_fact = find_factors(ARGV[0].to_i, 2, arr_fact)
if arr_fact[0] == nil || arr_fact[0] == ARGV[0].to_i
  puts 'Number are prime'
else
  puts arr_fact.to_s
end