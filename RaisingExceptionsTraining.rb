#RaisingExceptionsTraining.rb

arr_nums_name = ["zero", "one", "two", "three", "four", "five", "six", "seven",
                 "eight" "nine", "ten"];

begin
    puts "You input #{arr_nums_name[ARGV[0].to_i]}"
    i = 5 / ARGV[0].to_i
rescue
    puts "Input data is incorrect. Please, input integer greater from 0 to 10"
    exit
end
