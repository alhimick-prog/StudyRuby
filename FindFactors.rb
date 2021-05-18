#FindFactors.rb

def FindFactors(numb, max, i, arr_fact)
    if i <= max
        if (numb % i).zero?
            arr_fact << i if AreInArray(i, arr_fact) == false
            numb = numb / i
            i += 1
            arr_fact = FindFactors(numb, numb, i, arr_fact)
        else
            i += 1
            arr_fact = FindFactors(numb, numb, i, arr_fact)
        end
    else
        if (numb % i).zero?
            arr_fact << numb
        end
    end
    return arr_fact
end
def AreInArray(n, arr_fact)
    dop = 0
    arr_fact.each do |val|
        dop += 1 if (n % val).zero?
    end
    if !dop.zero?
        return true
    else
        return false
    end
end

arr_fact = Array.new
n = ARGV[0].to_i
arr_fact = FindFactors(n, n, 2, arr_fact)
if arr_fact[0] == nil || arr_fact[0] == n
    puts "Number are prime"
else
    print arr_fact
    puts ""
end