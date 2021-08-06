#RaiseToPower.rb
#This program is designed to raise numbers to large powers faster than standard multiplication.
#(This is the practice of solving problems in ruby from the book 
#Essential Algorithms: A Practical Approach to Computer Algorithms, Rod Stevens)

def raise(a, ind, a_counter, ind_counter, a_accum)
    if ind.zero?
        return a_accum
    elsif ind_counter * 2 <= ind
        a_counter = a_counter * a_counter
        ind_counter = ind_counter * 2
        return raise(a, ind, a_counter, ind_counter, a_accum)
    else
        ind = ind - ind_counter
        a_accum = a_accum * a_counter
        return raise(a, ind, a, 1, a_accum)
    end
end

a = ARGV[0].to_f
ind = ARGV[1].to_i
puts "Number is equal 0, 0 in any degree are 0" if a.zero?
puts "Number is equal 1, 1 in any degree are 1" if a == 1
puts "Index is equal 0, any numbers in index 0 equal 1" if ind.zero?
puts "Index less than 0. Sorry, but this program is designed to raise to positive exponents." if ind < 0
if a > 1 && ind > 0
    puts raise(a, ind, a, 1, 1).to_i
end