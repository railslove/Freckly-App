class Project < ActiveRecord::Base
  validates_presence_of :pivotal_id, :name, :total_minutes
end
