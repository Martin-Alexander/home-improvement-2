FactoryBot.define do
  factory :project do
    user
    title                     { "My String" }
    description               { "My String" }
    private                   { false }
    status                    { Project::STATUS_CREATED }
    estimated_level_of_effort { 10 }
    actual_level_of_effort    { 10 }
  end
end