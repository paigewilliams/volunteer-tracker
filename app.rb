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
