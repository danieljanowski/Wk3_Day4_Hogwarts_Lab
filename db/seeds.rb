require_relative('../models/student.rb')

Student.delete_all

student1 = Student.new({
  'first_name' => 'Michael',
  'last_name' => 'Drennan',
  'house' => 'Hufflepuff',
  'age' => 29
  })
student1.save

student2 = Student.new({
  'first_name' => 'Rob',
  'last_name' => 'Mathews',
  'house' => 'Slytherin',
  'age' => 36
  })
student2.save

student3 = Student.new({
  'first_name' => 'Daniel',
  'last_name' => 'Janowski',
  'house' => 'Gryffindor',
  'age' => 42
  })
student3.save

p Student.find_by_id(student3.id)
