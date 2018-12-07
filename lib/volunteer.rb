class Volunteer

  attr_reader(:id, :name, :project_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @project_id = attributes.fetch(:project_id)
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(another_volunteer)
    self.name().==(another_volunteer.name).&(self.id().==(another_volunteer.id())).&(self.project_id().==(another_volunteer.project_id()))
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      project_id = volunteer.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id,}))
    end
    volunteers
  end
  #
  # def self.find(id)
  #   returned_projects_by_id = DB.exec("SELECT * FROM projects WHERE id = #{id};")
  #   projects = []
  #   returned_projects_by_id.each do |project|
  #     name = project.fetch("name")
  #     id = project.fetch("id").to_i
  #     project_id = project.fetch("project_id").to_i
  #     projects.push(Project.new({:name => name, :id => id, :project_id => project_id}))
  #   end
  #   projects[0]
  # end
end
