#FindFactors.rb

def FindFactors(numb, max, i, arr_fact)
    if i <= max
        if (numb % i).zero?
            arr_fact << i if AreInArray(i, arr_fact) == false
            numb = numb / i
            i += 1
            max = Math.sqrt(numb)
            arr_fact = FindFactors(numb, max, i, arr_fact)
        else
            i += 1
            arr_fact = FindFactors(numb, max, i, arr_fact)
        end
    elsif numb != 1
        arr_fact << numb
    end
    return arr_fact
end
def AreInArray(n, arr_fact)
    dop = 0
    arr_fact.each do |val|
        dop += 1 if !(n % val).zero?
    end
    if !dop.zero?
        return false
    else
        return true
    end
end

arr_init = Array.new
n = ARGV[0].to_i
max = Math.sqrt(n)
arr_fact = FindFactors(n, max, 2, arr_init)
if arr_fact[0] == n || arr_fact[0] == nil
    puts "Number are prime"
else
    print arr_fact
    puts ""
end