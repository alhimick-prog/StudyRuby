#EuclidNOD.rb

def f_par_larger(a, b)
    a = ARGV[0].to_i
    b = ARGV[1].to_i
end
def s_par_larger(a, b)
    a = ARGV[1].to_i
    b = ARGV[0].to_i
end
def Euclid(a, b, ctrl)
    rem = a % b
    if !rem.zero? && rem != 1
        return Euclid(b, rem, rem)
    elsif rem.zero?
        return b
    else
        return "Numbers are coprime"
    end
end

f = ARGV[0].to_i
s = ARGV[1].to_i
f,s = s,f if f < s
if f == s
    puts "Numbers are equal"
elsif s.to_i.zero?
    puts "One or two of the numbers are 0"
else
    puts Euclid(f, s, 0)
end