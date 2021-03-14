FactoryBot.define do
  factory :comment do
    user
    project
    content { "My comment here" }
  end
end