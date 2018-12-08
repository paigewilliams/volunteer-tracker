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
  @volunteers = Volunteer.all
  erb(:index)
end

post("/add_volunteer") do
  project_id = params[:project].to_i
  name = params.fetch("name")
  volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer.save
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:index)
end

get("/project/:id") do
  id = params[:id].to_i
  @project = Project.find(id)
  @assigned_volunteers = @project.volunteers
  erb(:project)
end

get("/volunteer/:id") do
  @projects = Project.all
  id = params[:id].to_i
  @volunteer = Volunteer.find(id)
  project_id = @volunteer.project_id
  @assigned_project = Project.find(project_id)
  erb(:volunteer)
end


patch("/update_project/:id") do
  title = params.fetch("title")
  id = params[:id].to_i
  @project = Project.find(id)
  @project.update({:title => title, :id => nil})
  redirect ("/project/#{id}")
end

patch("/update_volunteer/:id")do
  name = params.fetch("name")
  project_id = params[:project].to_i
  id = params[:id].to_i
  @volunteer = Volunteer.find(id)
  @volunteer.update({:name => name, :project_id => project_id, :id => nil})
  redirect("/volunteer/#{id}")
end

get("/projects/:id/edit")do
  id = params[:id].to_i
  @project = Project.find(id)
  erb(:delete_project)
end

get("/volunteer/:id/edit")do
  id= params[:id].to_i
  @volunteer = Volunteer.find(id)
  erb(:delete_volunteer)
end

delete("/delete/:id") do
  id = params[:id].to_i
  @project = Project.find(id)
  @project.delete
  volunteers = @project.volunteers
  project_id = 0
  volunteers.each do |volunteer|
    name = volunteer.name
    volunteer.update({:name => name, :project_id => project_id, :id => nil})
  end
  redirect ("/")
end

delete("/delete_volunteer/:id") do
  id = params[:id].to_i
  @volunteer = Volunteer.find(id)
  @volunteer.delete
  redirect ("/")
end
