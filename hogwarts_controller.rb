require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/student')
also_reload('./models/*')

get("/") do
  @students = Student.all
  @houses = House.all
  erb(:index)
end

get("/new") do
  @houses = House.all()
  erb(:new)
end

post '/student' do # create
  @student = Student.new( params )
  @student.save()
  erb( :create )
end

post("/new") do
  @houses = House.all()
  erb(:new)
end
