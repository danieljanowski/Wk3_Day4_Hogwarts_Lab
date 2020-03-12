require_relative('../db/sql_runner.rb')
require_relative('house.rb')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house'].to_i
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students
          (first_name,
            last_name,
            house,
            age)
            VALUES
            ($1, $2, $3, $4)
            RETURNING id"
    values = [@first_name, @last_name, @house, @age]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def find_house
    sql = "SELECT * FROM houses
            WHERE id = $1"
    values = [@house]
    SqlRunner.run(sql,values).map{|house|House.new(house)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students
            WHERE id = $1"
    values = [id]
    Student.new(SqlRunner.run(sql, values).first)
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT students.*, houses.name, houses.logo FROM students
            INNER JOIN houses ON students.house = houses.id
            ORDER BY houses.id"
    students = SqlRunner.run(sql)
    return students.map{|student| student}
  end

end
