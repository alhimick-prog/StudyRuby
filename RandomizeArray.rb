#RandomizeArray.rb
#Just randomize array

example_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

def randomize(inp_arr)
  inp_arr.each_with_index do |value, ind|
    n = rand(inp_arr.size)
    inp_arr[n], inp_arr[ind] = inp_arr[ind], inp_arr[n]
  end
end

puts example_array.to_s
puts 'Randomize to:'
puts randomize(example_array).to_s