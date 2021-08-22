# matrix.rb
# Shares a matrix into rows and columns.

def number_of_rows(matrix)
  counter = 1
  matrix.each_char { |symb|
    counter += 1 if symb == "\n"
  }
  counter
end
def number_of_columns(matrix)
  counter = 1
  matrix.each_char { |symb|
    counter += 1 if symb == " "
    break if symb == "\n"
  }
  counter
end
def split_to_rows(matrix)
  lines = Array.new(number_of_rows(matrix)) {Array.new(number_of_columns(matrix))}
  current_row = 0
  current_column = 0
  for i in 0..(matrix.size - 1) do
    if matrix[i] == " "
      current_column += 1
    elsif matrix[i] == "\n" || i == matrix.size
      current_row += 1
      current_column = 0
    else
      if lines[current_row][current_column] == nil
        lines[current_row][current_column] = matrix[i]
      else
        lines[current_row][current_column] += matrix[i]
      end
    end
  end
  lines
end
def split_to_columns(matrix)
  lines = split_to_rows(matrix)
  columns_numb = number_of_columns(matrix)
  rows_numb = number_of_rows(matrix)
  columns = Array.new(columns_numb) {Array.new(rows_numb)}
  counter = 0
  for c in 0..(columns_numb - 1) do
    for r in 0..(rows_numb - 1) do
      columns[c][r] = lines[r][c]
    end
  end
  columns
end
def shares_and_display(matrix)
  fail 'Incorrect input.' if matrix.empty?
  puts 'Rows:'
  for i in 0..(number_of_rows(matrix) - 1) do
    puts split_to_rows(matrix)[i].to_s
  end
  puts 'Columns:'
  for i in 0..(number_of_columns(matrix) - 1) do
    puts split_to_columns(matrix)[i].to_s
  end
end

puts "Input matrix:\n1 4 9\n16 25 36"
shares_and_display("1 4 9\n16 25 36")
puts "Input matrix:\n1 2 3\n10 20 30\n100 200 300"
shares_and_display("1 2 3\n10 20 30\n100 200 300")
puts "Input matrix:\n89 1903 3\n18 3 1\n9 4 800"
shares_and_display("89 1903 3\n18 3 1\n9 4 800")