def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
  if student[:name].start_with?("B")
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
  puts "To finish, just leave each question blank (press enter)."
  # create an empty array
  students = []
  # get first name
  name = gets.chomp
  puts "And their hobby?"
  hobby = gets.chomp
  puts "And their height?"
  height = gets.chomp
  puts "Their cohort?"
  cohort = gets.chomp.to_sym
  # while name is not empty, repeat this code
  while !name.empty? do
    # add student hash to the array
    students << {name: name, cohort: cohort, hobby: hobby, height: height}
    puts "Now we have #{students.count} students. Please enter another."
    # get more info from the user
    name = gets.chomp
    puts "And their hobby?"
    hobby = gets.chomp
    puts "And their height?"
    height = gets.chomp
    puts "Their cohort?"
    cohort = gets.chomp.to_sym
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
loop(students)
