#EuclidNOD.rb
#This program search greatest common divisor for two number with using Euclidean algorithm.
#Input two number like argument in comand line.

def euclidean(a, b, ctrl)
    rem = a % b
    if !rem.zero? && rem != 1
        return euclidean(b, rem, rem)
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
elsif s.zero?
    puts "One or two of the numbers are 0"
else
    puts euclidean(f, s, 0)
end