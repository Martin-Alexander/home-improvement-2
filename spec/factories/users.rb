FactoryBot.define do
  factory :user do
    email { "bob-#{rand}@email.com" }
    name  { "Bob Smith" }

    after(:build) do |user|
      user.password_confirmation = "123456"
      user.password = "123456"
    end
  end
end