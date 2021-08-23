#grep.rb
=begin
Program takes command line arguments containing
1.flags
2.regular expression in ""
3.filenames.
Example:
ruby grep.rb "regular expression" filename.txt
ruby grep.rb -flag1 -flag2 "regular expression" filename1.txt filename2.txt
Program support the following flags:
- `-n` Print the line numbers of each matching line.
- `-l` Print only the names of files that contain at least one matching line.
- `-i` Match line using a case-insensitive comparison.
- `-v` Invert the program -- collect all lines that fail to match the pattern.
- `-x` Only match entire lines, instead of lines that contain a match.
=end

def analysis_of_arguments(arguments)
  fail 'Not enough arguments.' if arguments.size < 2
  arg_hash = { '-n' => false, '-l' => false, '-i' => false, '-v' => false, '-x' => false, 'curr_arg' => 0 }
  supporting_flags = [ '-n', '-l', '-i', '-v', '-x']
  arguments.each_with_index do |value, arg_numb|
    is_it_flag = false
    supporting_flags.each_with_index do |flag, index|
      if value == flag
        supporting_flags[index] = ''
        arg_hash[flag] = true
        is_it_flag = true
      end
    end
    if is_it_flag
      is_it_flag = false
    else
      arg_hash['curr_arg'] = arg_numb
      break
    end
  end
  arg_hash
end
def determ_pattern(arguments, arg_hash)
  pattern = arguments[arg_hash['curr_arg']]
  arg_hash['curr_arg'] += 1
  pattern
end
def determ_filenames(arguments, arg_hash)
  filenames = Array.new
  counter = 0
  for i in arg_hash['curr_arg']..(arguments.size - 1) do
    filenames[counter] = arguments[arg_hash['curr_arg']]
    arg_hash['curr_arg'] +=1
    counter += 1
  end
  filenames
end
def print_line_number #-n
end
def print_filenames #-l
end
def insensitivite #-i
end
def invert #-v
end
def all_line #-x
end
def file_check(filenames)
  fail "File #{filenames[i]} not found"
end
def filework(filenames)
  for i in 0..(filenames.size - 1) do
    File.open(filenames[i], 'r') |curr_file| do
    end
  end
end


arguments = ARGV
puts arguments.to_s
arg_hash = analysis_of_arguments(arguments)
puts arg_hash
pattern = determ_pattern(arguments, arg_hash)
puts pattern
puts arg_hash
filenames = determ_filenames(arguments, arg_hash)
puts filenames.to_s
puts arg_hash

#puts arguments[analysis_of_arguments(arguments)['curr_arg']]
