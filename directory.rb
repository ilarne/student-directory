@students = [] # empty array accessible to all methods

def try_load_students
  filename = ARGV.first
  return if filename.nil? # leave method if filename isn't fiven
  if File.exists?(filename) # check given file exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
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
  process(STDIN.gets.chomp)
  end
end

def move_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students, then their personal information."
  puts "To finish,  press Enter."
  name = STDIN.gets.chomp
  cohort = :november
  while !name.empty? do
    move_students(name, cohort)
    # add student hash to the array
    #@students << {
      #name: name, cohort: :november }
    if @students.count == 1
      puts "Now we have 1 student. Please enter another."
    else
    puts "Now we have #{@students.count} students. Please enter another."
  end
    # get more info from the user
    name = STDIN.gets.chomp
  end
end

def print_header
   x =  "The students of Villains Academy"
   y =  "-------------"
   puts x.center(100)
   puts y.center(100)
end

def print_students_list
 if @students.count == 0
   puts "There are no students enrolled..."
 else
  @students.each do |student|
  x = "#{student[:name]} (#{student[:cohort]} cohort)."
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

def save_students
  # open the file for writing
  file = File.open("students.csv", "w") # created file object called students.csv with write access mode
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",") # joins array together as a string separated by ","
    file.puts csv_line  # call puts on file to write csv_line to file
  end
  file.close
end

def load_students(filename = "students.csv") # students.csv is now default arugment if none is given
  file = File.open(filename, "r")
  file.readlines.each do |line| # read all lines into an array and iterate over it
# below we assign two variables at the same time. For arrays, the first variable gets the first value, the second = seconds value, etc
    name, cohort = line.chomp.split(',') # on each iteration we discard new line char and split at comma
    move_students(name, cohort)
  end
  file.close
end

try_load_students
interactive_menu
