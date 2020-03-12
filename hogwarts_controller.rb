require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./models/student')
also_reload('./models/*')

get("/") do
  @students = Student.all
  erb(:index)
end
