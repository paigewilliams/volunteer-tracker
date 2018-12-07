require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("pry")
require("./lib/project")
require("./lib/volunteer")
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get ("/") do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

post("/add_project") do
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil})
  project.save
  @projects = Project.all
  erb(:index)
end

get("/project/:id") do
  id = params[:id].to_i
  @project = Project.find(id)
  @volunteers = Volunteer.all
  erb(:project)
end

# get("/add_volunteer") do
#   project_id = params[:id].to_i
#   name = params.fetch("name")
#   volunteer = Project.new({:name => name, :project_id => project_id, :id => nil})
#   volunteer.save
#   @volunteers = Volunteer.all
#   @projects = Project.all
#   @project = Project.find(id)
#   binding.pry
#   redirect("/project/:id")
# end

patch("/update/:id") do
  title = params.fetch("title")
  id = params[:id].to_i
  @project = Project.find(id)
  @project.update({:title => title, :id => nil})
  redirect ("/project/#{id}")
end

get("/projects/:id/edit")do
  id = params[:id].to_i
  @project = Project.find(id)
  erb(:delete)
end

delete("/delete/:id") do
  id = params[:id].to_i
  @project = Project.find(id)
  @project.delete
  redirect ("/")
end
