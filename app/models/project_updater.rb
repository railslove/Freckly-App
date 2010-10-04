class ProjectUpdater
  class << self
    def update
      PivotalTracker::Project.all.each do |project|
        new(project).save if project.name.match(::PIVOTAL_PROJECT_NAME)
      end
    end
  end

  def initialize(pivotal_project)
    @pivotal_project = pivotal_project
  end

  def name
    @pivotal_project.name
  end

  def id
    @pivotal_project.id
  end

  # TODO: kinda meh...
  def total_minutes
    if freckle_project
      freckle_project.entries.inject(0) {|sum, entry| entry.minutes }
    end
  end

  def save
    if project = Project.where(:pivotal_id => id).first
      project.update_attributes(:total_minutes => total_minutes, :name => name)
    else
      Project.create(:pivotal_id => id, :total_minutes => total_minutes, :name => name)
    end
  end

  private

  # The Freckle project name has to be the same as the Pivotal one
  def freckle_project
    @freckle_project ||= Freckly::Project.all.select {|project| project.name.downcase == name.downcase }.first
  end
end