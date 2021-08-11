#EuclidNOD.rb
#This program search greatest common divisor for two number with using Euclidean algorithm.
#Input two number like argument in comand line.

def euclidean(a, b, ctrl)
  rem = a % b
  if !rem.zero? && rem != 1
    euclidean(b, rem, rem)
  elsif rem.zero? && !(b == 1)
    b
  else
    'Numbers are coprime'
  end
end

f = ARGV[0].to_i
s = ARGV[1].to_i
f,s = s,f if f < s
fail 'Incorrect input. It takes two number.' if !(ARGV.size == 2)
fail 'Numbers are equal.' if f == s
fail 'One or two of the numbers are 0' if s.zero?
puts euclidean(f, s, 0)