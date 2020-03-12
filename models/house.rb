require_relative('../db/sql_runner.rb')

class House

  attr_reader :id, :logo, :name


  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo'] if options['logo']
  end

  def save
    sql = "INSERT INTO houses
          (name,
            logo
          )
            VALUES
            ($1, $2)
            RETURNING id"
    values = [@name, @logo]
    @id = SqlRunner.run(sql, values).first['id'].to_i
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses
          WHERE id = $1"
    values = [id]
    House.new(SqlRunner.run(sql, values).first)
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM houses ORDER BY name"
    houses = SqlRunner.run(sql)
    return houses.map{|house| House.new(house)}
  end
end
