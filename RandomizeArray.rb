#RandomizeArray.rb
#Just randomize array

j_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

def randomize(inp_arr)
    inp_arr.each_with_index do |val, ind|
        n = rand(inp_arr.size)
        val = inp_arr[n]
        inp_arr[n], inp_arr[ind] = inp_arr[ind], val
        ind += 1
    end
end

print j_array
puts ""
puts "Randomize to"
randomize(j_array)
print j_array
puts ""
