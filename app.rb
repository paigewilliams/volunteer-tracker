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
  erb(:project)
end

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
