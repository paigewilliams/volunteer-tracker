class Project

  attr_reader(:id, :title)

  def initialize(attributes)
    @title = attributes.fetch(:title)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end


end
