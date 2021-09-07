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
  is_it_flag = false
  arguments.each_with_index do |value, arg_numb|
    supporting_flags.each_with_index do |flag, index|
      if value == flag
        supporting_flags[index] = ''
        arg_hash[flag] = true
        is_it_flag = true
      end
    end
    if is_it_flag
      is_it_flag = false
      arg_hash['curr_arg'] += 1
    else
      supporting_flags = []
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
  filenames = []
  counter = 0
  (arg_hash['curr_arg']..(arguments.size - 1)).each do |i|
    filenames[counter] = arguments[i]
    counter +=1
  end
  filenames
end

def file_check(filenames)
  fail 'No file name found.' if filenames.empty?
  filenames.each do |filename|
    fail "File #{filename} not found" if !(File::exists?(filename))
  end
end

def filework(filenames, arg_hash, pattern)
  many_files = false
  many_files = true if filenames.size > 1
  for i in 0..(filenames.size - 1) do
    file_content = IO.readlines(filenames[i])
    if arg_hash['-l']
      puts filenames[i] if print_filenames?(file_content, arg_hash, pattern, filenames[i])
    else
      puts "#{filenames[i]}:" if many_files && print_filenames?(file_content, arg_hash, pattern, filenames[i])
      if arg_hash['-x']
        all_line(file_content, arg_hash, pattern, filenames[i])
      else
        pattern_in_line(file_content, arg_hash, pattern, filenames[i])
      end
    end
  end
end

def print_filenames?(file_content, arg_hash, pattern, filename) #-l true
  match = false
  if arg_hash['-x']
    match = filename_all_line(file_content, arg_hash, pattern)
  else
    match = filename_pattern_in_line(file_content, arg_hash, pattern)
  end
  match
end

def filename_all_line(file_content, arg_hash, pattern) #-l & -x true
  match = false
  counter = 0
  if arg_hash['-i']
    file_content.each do |line|
      if line.downcase.chomp == pattern.downcase.chomp
        match = true
        counter += 1
      end
    end
  else
    file_content.each do |line|
      if line.chomp == pattern.chomp
        match = true
        counter += 1
      end
    end
  end
  match = true if arg_hash['-v']
  match = false if arg_hash['-v'] && counter == file_content.size
  match
end

def filename_pattern_in_line(file_content, arg_hash, pattern) #-l true -x false
  match = false
  counter = 0
  if arg_hash['-i']
    file_content.each do |line|
      if line.downcase =~ /#{pattern.downcase}/
        match = true
        counter += 1
      end
    end
  else
    file_content.each do |line|
      if line =~ /#{pattern}/
        match = true
        counter += 1
      end
    end
  end
  match = true if arg_hash['-v']
  match = false if arg_hash['-v'] && counter == file_content.size
  match
end

def all_line(file_content, arg_hash, pattern, filename) #-l false -x true
  if arg_hash['-i']
    file_content.each_with_index do |line, line_numb|
      match = false
      match = true if line.downcase.chomp == pattern.downcase.chomp
      match = !match if arg_hash['-v']
      if match && arg_hash['-n']
        puts "#{line_numb + 1}. #{line}"
      elsif match
        puts line
      end
    end
  else
    file_content.each_with_index do |line, line_numb|
      match = false
      match = true if line.chomp == pattern.chomp
      match = !match if arg_hash['-v']
      if match && arg_hash['-n']
        puts "#{line_numb + 1}. #{line}"
      elsif match
        puts line
      end
    end
  end
end

def pattern_in_line(file_content, arg_hash, pattern, filename) #-l & -x false
  if arg_hash['-i']
    file_content.each_with_index do |line, line_numb|
      match = false
      match = true if line.downcase =~ /#{pattern.downcase}/
      match = !match if arg_hash['-v']
      if match && arg_hash['-n']
        puts "#{line_numb + 1}. #{line}"
      elsif match
        puts line
      end
    end
  else
    file_content.each_with_index do |line, line_numb|
      match = false
      match = true if line =~ /#{pattern}/
      match = !match if arg_hash['-v']
      if match && arg_hash['-n']
        puts "#{line_numb + 1}. #{line}"
      elsif match
        puts line
      end
    end
  end
end

arguments = ARGV
#puts "Input agument:\n#{arguments.to_s}"
arg_hash = analysis_of_arguments(arguments)
#puts "After analis arg_hash:\n#{arg_hash}"
pattern = determ_pattern(arguments, arg_hash)
#puts "Pattern: #{pattern}"
filenames = determ_filenames(arguments, arg_hash)
#puts "Filenames:\n#{filenames.to_s}"
file_check(filenames)
filework(filenames, arg_hash, pattern)
