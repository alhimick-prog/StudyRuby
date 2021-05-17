#RaiseToPower.rb

def Raise(a, ind, a_counter, ind_counter, a_accum)
    if ind == 0
        return a_accum
    elsif ind_counter * 2 <= ind
        a_counter = a_counter * a_counter
        ind_counter = ind_counter * 2
        return Raise(a, ind, a_counter, ind_counter, a_accum)
    else
        ind = ind - ind_counter
        a_accum = a_accum * a_counter
        return Raise(a, ind, a, 1, a_accum)
    end
end

$a = ARGV[0].to_i
$ind = ARGV[1].to_i
puts "Number is equal 0, 0 in any degree are 0" if $a == 0
puts "Number is equal 1, 1 in any degree are 1" if $a == 1
puts "Index is equal 0, any numbers in index 0 equal 1" if $ind == 0
if $a > 1 && $ind != 0
    puts Raise($a, $ind, $a, 1, 1)
end