require_relative('../models/student.rb')
require_relative('../models/house.rb')


Student.delete_all
House.delete_all
house1 = House.new({
  'name' => "Gryffindor",
  'logo' => "https://vignette.wikia.nocookie.net/harrypotter/images/e/ee/Gryffindor_Crest-0.jpg/revision/latest/scale-to-width-down/182?cb=20160729145529"
  })
house2 = House.new({
  'name' => "Hufflepuff",
  'logo' => "https://vignette.wikia.nocookie.net/harrypotter/images/6/62/Download_%289%29.jpg/revision/latest?cb=20160729145653"
  })
house3 = House.new({
  'name' => "Ravenclaw",
  'logo' => "https://vignette.wikia.nocookie.net/harrypotter/images/2/28/Download_%284%29.jpg/revision/latest?cb=20160729145945"
  })
house4 = House.new({
  'name' => "Slytherin",
  'logo' => "https://vignette.wikia.nocookie.net/harrypotter/images/7/72/Ccd53034-c798-452a-8032-f28e06250d8f.jpg/revision/latest/scale-to-width-down/160?cb=20160729150848"
  })

house1.save
house2.save
house3.save
house4.save

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



p(House.all)
