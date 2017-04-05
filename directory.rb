require 'csv'
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
    puts "Type which file to load."
    file = STDIN.gets.chomp
    load_students(file)
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
    if @students.count == 1
      puts "Now we have 1 student. Please enter another."
    else
    puts "Now we have #{@students.count} students. Please enter another."
  end
    # get more info from the user
    name = STDIN.gets.chomp
  end
  puts "Student entered."
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
  CSV.open("students.csv", "w") {|file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    file.puts student_data
    end
  }
  puts "File saved."
end

def load_students(file)
  if File.exists?(file)
  CSV.foreach(file, "r") { |line|
    name, cohort = line[0], line[1]
    move_students(name, cohort)
    }
    puts "File loaded."
  else
    puts "Sorry, #{file} doesn't exist."
  end
end

try_load_students
interactive_menu
