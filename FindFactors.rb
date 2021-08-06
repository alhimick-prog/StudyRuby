#FindFactors.rb
#This program search all prime divisor for number.
#Input number like an argument in command line.
#This is a bad version because it uses recursion and does not work with very large numbers.

def findFactors(numb, i, arr_fact)
    if i <= numb
        if (numb % i).zero?
            numb = numb / i
            arr_fact << i if areInArray(i, arr_fact) == false
            arr_fact = findFactors(numb, i, arr_fact)
        else
            i += 1
            arr_fact = findFactors(numb, i, arr_fact)
        end
    else
        if (numb % i).zero?
            arr_fact << numb
        end
    end
    return arr_fact
end
def areInArray(n, arr_fact)
    dop = false
    arr_fact.each do |val|
        dop = true if (n % val).zero?
    end
    return dop
end

if ARGV[0] == nil
    puts "You not input number"
elsif ARGV[0].to_i < 0
    puts "Number cannot be less than zero"
elsif ARGV[0].to_i.zero?
    puts "Are you kidding me? You input 0"
elsif ARGV[0].to_i == 1
    puts "Are you kidding me? You input 1"
else
    n = ARGV[0].to_i
    arr_fact = Array.new
    arr_fact = findFactors(n, 2, arr_fact)
    if arr_fact[0] == nil || arr_fact[0] == n
        puts "Number are prime"
    else
        puts arr_fact.to_s
        print ""
    end
end