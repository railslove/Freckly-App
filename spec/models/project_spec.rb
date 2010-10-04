require 'spec_helper'

describe Project do
  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:total_minutes) }
    it { should validate_presence_of(:pivotal_id) }
  end
end
