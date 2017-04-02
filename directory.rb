@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean. Try again."
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students, then their personal information."
  puts "To finish,  press Enter."
  name = gets.chomp
  puts "And their hobby?"
  hobby = gets.chomp
  puts "And their height?"
  height = gets.chomp
  puts "Their cohort?"
  cohort = gets.chomp

  while !name.empty? do
    # add student hash to the array
    @students << {
      name: default(name),
      cohort: default_cohort(cohort).to_sym.capitalize,
      hobby: default(hobby),
      height: default(height)
  }
    if @students.count == 1
      puts "Now we have 1 student. Please enter another."
    else
    puts "Now we have #{@students.count} students. Please enter another."
  end
    # get more info from the user
    name = gets.chomp
    if !name.empty?
    puts "And their hobby?"
    hobby = gets.chomp
    puts "And their height?"
    height = gets.chomp
    puts "Their cohort?"
    cohort = gets.chomp
   end
  end
end

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
  until month.include?(x.downcase)
    puts "Please choose a correct month."
    x = gets.chomp
  end
  x
end

def print_students_list
 if @students.count == 0
   puts "There are no students enrolled..."
 else
  @students.each_with_index do |student, index|
  x = "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). Hobbies: #{student[:hobby]}. Height: #{student[:height]}."
  puts x.center(100)
   end
 end
end

def print_footer
  if @students.count == 0
    puts ""
  else
   puts "Overall, we have #{@students.count} great @students."
 end
end

interactive_menu
