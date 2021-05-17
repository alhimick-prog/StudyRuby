#EuclidNOD.rb

def f_par_larger
    $a = ARGV[0].to_i
    $b = ARGV[1].to_i
end
def s_par_larger
    $a = ARGV[1].to_i
    $b = ARGV[0].to_i
end
def Euclid(a, b, ctrl)
    rem = a % b
    if rem.to_i != 0 && rem.to_i != 1
        return Euclid(b, rem, rem)
    elsif rem.to_i == 0
        return b
    else
        return "Numbers are coprime"
    end
end

ARGV[0] > ARGV[1] ? f_par_larger : s_par_larger
if $a == $b
    puts "Numbers are equal"
elsif $b.to_i == 0
    puts "One or two of the numbers are 0"
else
    puts Euclid($a, $b, 0)
end