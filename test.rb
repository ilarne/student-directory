students = [
  {name: "Dr. Hannibal Lecter", cohort: :january},
  {name: "Darth Vader", cohort: :february},
  {name: "Nurse Ratched", cohort: :february},
  {name: "Michael Corleone", cohort: :january},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :march},
  {name: "The Joker", cohort: :march},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

# group_by returns a hash grouped by the specified key (in this case cohort)
students.group_by { |hash| hash[:cohort]}.each {|key, value| # new hash has value of cohort (month) as the key
puts "#{key.capitalize}" # this shows the month
puts "--------"
value.each {|v|
  puts v[:name]
} # look at all the values, for each element print the value of name
puts ""
}
