#FindFactorsWithLoop.rb
#This program search all prime divisor for number.
#Input number like an argument in command line.
#This version is better than the recursion version because it can handle large numbers.
#Program can work for a long time with very large numbers with large prime divisor, for example 9999999999999

def findFactors(numb, arr_fact)
    i = 2
    while i <= numb
        if (numb % i).zero?
            arr_fact << i if areInArray(i, arr_fact) == false
            numb = numb / i
        else
            i += 1
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
    arr_fact = findFactors(n, arr_fact)
    if arr_fact[0] == nil || arr_fact[0] == n
        puts "Number are prime"
    else
        puts arr_fact.to_s
        print ""
    end
end