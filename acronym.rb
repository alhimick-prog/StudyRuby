# acronym.rb
# Converts a phrase to an acronym.

inp_string = STDIN.gets.chomp
fail 'Incorrect input.' if inp_string.empty?
long = inp_string.size
outp_string = ''
outp_string = inp_string[0].upcase if (('a'..'z') === inp_string[0] || ('A'..'Z') === inp_string[0])
(1..(inp_string.size)).each do |i|
  if (('a'..'z') === inp_string[i] || ('A'..'Z') === inp_string[i]) && (inp_string[(i - 1)] == ' ' || inp_string[(i - 1)] == '-')
    outp_string += inp_string[i].upcase
  end
end
fail 'Failed to create acronym.' if outp_string.empty?
puts outp_string