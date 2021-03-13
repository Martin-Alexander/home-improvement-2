class ActiveRecord::Base
  after_create :log_attributes

  def log_attributes
    p attributes
  end
end

puts "Clearing database"
User.destroy_all

5.times do |i|
  puts "Creating user"
  user = User.create!(email: "user-#{i + 1}@email.com", password: "123456")

  puts "Creating 2 projects"
  2.times do
    Project.create!(
      user: user,
      title: "#{Faker::Appliance.equipment}, #{Faker::Appliance.equipment}, and #{Faker::Appliance.equipment}",
      description: Faker::Lorem.sentence(word_count: 20),
      status: [Project::STATUS_CREATED, Project::STATUS_STARTED, Project::STATUS_STOPPED, Project::STATUS_COMPLETED].sample,
      estimated_level_of_effort: rand(1..10),
      actual_level_of_effort: rand(1..10)
    )
  end
end

puts "Creating admin user"
user = User.create!(email: "admin@email.com", password: "123456", admin: true)