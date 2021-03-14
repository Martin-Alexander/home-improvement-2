require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:estimated_level_of_effort) }
    it { should validate_presence_of(:actual_level_of_effort) }
    it { should validate_inclusion_of(:actual_level_of_effort).in_array((1..10).to_a) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status) .in_array(Project::STATUSES) }
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
