class Project

  attr_reader(:id, :title, :volunteer_id)

  def initialize(attributes)
    @title = attributes.fetch(:title)
  end


end
