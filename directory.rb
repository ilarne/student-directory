def default(x)
  if !x.empty?
    x
  else
    "Unknown"
  end
end

def print_header
  x =  "The students of Villains Academy"
  y =  "-------------"
  puts x.center(100)
  puts y.center(100)
end

def default_cohort(x)
  month = %w(january february march april may june july august september october november december)
  x.downcase
  until month.include?(x)
    puts "Please choose a correct month."
    x = gets.delete("\n")
  end
  x
end

def print(students)
  title = "Here are all the students together:"
  puts title.center(100)
  students.each_with_index do |student, index|
  if student[:name].length < 12
  x = "#{index}. #{student[:name]} (#{student[:cohort]} cohort). Hobbies: #{student[:hobby]}. Height: #{student[:height]}."
  puts x.center(100)
   end
 end
end

def loop(students)
  x = 0
  until x == students.count
    puts "#{students[x][:name]} (#{students[x][:cohort]} cohort). Hobbies: #{students[x][:hobby]}. Height: #{students[x][:height]}."
  x += 1
end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end

def input_students
  puts "Please enter the names of the students, then their personal information."
  puts "To finish,  press Enter."
  # create an empty array
  students = []

  name = gets.delete("\n")
  puts "And their hobby?"
  hobby = gets.delete("\n")
  puts "And their height?"
  height = gets.delete("\n")
  puts "Their cohort?"
  cohort = gets.delete("\n")

  while !name.empty? do
    # add student hash to the array
    students << {
      name: default(name),
      cohort: default_cohort(cohort).to_sym,
      hobby: default(hobby),
      height: default(height)
  }
    if students.count == 1
      puts "Now we have 1 student. Please enter another."
    else
    puts "Now we have #{students.count} students. Please enter another."
  end
    # get more info from the user
    name = gets.delete("\n")
    if !name.empty?
    puts "And their hobby?"
    hobby = gets.delete("\n")
    puts "And their height?"
    height = gets.delete("\n")
    puts "Their cohort?"
    cohort = gets.delete("\n")
   end
  end
  students
end

def cohort_list students
students.group_by { |hash| hash[:cohort]}.each {|key, value| # new hash has value of cohort (month) as the key
x = "#{key.capitalize} Cohorts" # this shows the month
y = "--------"
puts x.center(100)
puts y.center(100)
value.each {|v|
  puts v[:name].center(100)
} # look at all the values, for each element print the value of name
puts ""
}
end

students = input_students
print_header
cohort_list(students)
print(students)
print_footer(students)
