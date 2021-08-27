#meetup.rb

def meeting_year(meetup_string)
  place = meetup_string =~ /(1|2)\d{3}/ #search year 1xxx-2xxx
  year_of_meetup = ''
  if !place.nil?
    year_of_meetup = meetup_string[place..(place + 3)]
  end
  year_of_meetup
end

def month_of_meetup(meetup_string)
  month = 0
  month = 1 if meetup_string =~ /(j|J)anuary/
  month = 2 if meetup_string =~ /(f|F)ebruary/
  month = 3 if meetup_string =~ /(m|M)arch/
  month = 4 if meetup_string =~ /(a|A)pril/
  month = 5 if meetup_string =~ /(m|M)ay/
  month = 6 if meetup_string =~ /(j|J)une/
  month = 7 if meetup_string =~ /(j|J)uly/
  month = 8 if meetup_string =~ /(a|A)ugust/
  month = 9 if meetup_string =~ /(s|S)eptember/
  month = 10 if meetup_string =~ /(o|O)ctober/
  month = 11 if meetup_string =~ /(n|N)ovember/
  month = 12 if meetup_string =~ /(d|D)ecember/
  month
end

def day_of_week(meetup_string)
  weekday_name = ''
  weekday_name = 'Sunday' if meetup_string =~ /(s|S)unday/
  weekday_name = 'Monday' if meetup_string =~ /(m|M)onday/
  weekday_name = 'Tuesday' if meetup_string =~ /(t|T)uesday/
  weekday_name = 'Wednesday' if meetup_string =~ /(w|W)ednesday/
  weekday_name = 'Thursday' if meetup_string =~ /(t|T)hursday/
  weekday_name = 'Friday' if meetup_string =~ /(f|F)riday/
  weekday_name = 'Saturday' if meetup_string =~ /(s|S)aturday/
  weekday_name
end

def day_of_week_teenth(meetup_string)
  day_teenth = ''
  day_teenth = 'Monday' if meetup_string =~ /(m|M)onteenth/
  day_teenth = 'Tuesday' if meetup_string =~ /(t|T)uesteenth/
  day_teenth = 'Wednesday' if meetup_string =~ /(w|W)ednesteenth/
  day_teenth = 'Thursday' if meetup_string =~ /(t|T)hursteenth/
  day_teenth = 'Friday' if meetup_string =~ /(f|F)riteenth/
  day_teenth = 'Saturday' if meetup_string =~ /(s|S)aturteenth/
  day_teenth = 'Sunday' if meetup_string =~ /(s|S)unteenth/
  day_teenth
end

def search_adjective_of_weekday(meetup_string)
  adjective_of_day = nil
  adjective_of_day = 1 if meetup_string =~ /(f|F)irst/
  adjective_of_day = 2 if meetup_string =~ /(s|S)econd/
  adjective_of_day = 3 if meetup_string =~ /(t|T)hird/
  adjective_of_day = 4 if meetup_string =~ /(f|F)ourth/
  adjective_of_day = 5 if meetup_string =~ /(f|F)ifth/
  adjective_of_day = 6 if meetup_string =~ /(l|L)ast/
  adjective_of_day
end

def determine_mounth_day(meetup_string)
  year = meeting_year(meetup_string)
  month = month_of_meetup(meetup_string)
  all_month = []
  meeting_time = Time.new(year.to_i, month)
  i = 0
  until !((meeting_time + (3600 * 24 * i)).strftime('%B') == meeting_time.strftime('%B'))
    all_month[i] = (meeting_time + (3600 * 24 * i)).strftime('%A')
    i += 1
  end
  if !(day_of_week(meetup_string).empty?)
    number_of_weekday = search_adjective_of_weekday(meetup_string)
    fail 'Number of weekday not found.' if number_of_weekday.nil?
    day_of_month = 0
    counter = 0
    if number_of_weekday == 5
      all_month.each_with_index do |weekday, index|
        counter += 1 if weekday == day_of_week(meetup_string)
      end
      if counter < number_of_weekday
        fail "Sorry, but in this month only 4 #{day_of_week(meetup_string)}."
      end
      counter = 0
    end
    all_month.each_with_index do |weekday, index|
      counter += 1 if weekday == day_of_week(meetup_string)
      day_of_month = (index + 1) if weekday == day_of_week(meetup_string)
      if counter == number_of_weekday
        day_of_month = (index + 1)
        break
      end
    end
  elsif !(day_of_week_teenth(meetup_string).empty?)
    weekday_name = day_of_week_teenth(meetup_string)
    (12..18).each do |i|
      day_of_month = (i + 1) if all_month[i] == weekday_name
    end
  else
    fail 'Day of week could not be determined.'
  end
  day_of_month
end

def date_of_meetup(meetup_string)
  year = meeting_year(meetup_string)
  fail 'Year could not be determined.' if year.empty?
  month = month_of_meetup(meetup_string)
  fail 'Month could not be determined.' if month.zero?
  day = determine_mounth_day(meetup_string)
  meeting_time = Time.new(year, month, day)
end

meetup_string = 'saturteenth december 1999'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'monteenth of may 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'monteenth of august 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'first monday of march 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'first monday of april 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'second monday of march 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'second wednesday of august 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'fourth tuesday of june 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'last monday of march 2013'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')
meetup_string = 'first friday of december 2012'
puts meetup_string
puts date_of_meetup(meetup_string).strftime('%Y/%m/%d')

#diagnostic information
#puts meeting_year(meetup_string)
#puts month_of_meetup(meetup_string)
#puts day_of_week(meetup_string)
#puts day_of_week_teenth(meetup_string)
#puts search_adjective_of_weekday(meetup_string)