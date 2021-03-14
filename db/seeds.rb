class ActiveRecord::Base
  after_create :log_attributes

  def log_attributes
    p attributes
  end
end

puts "== Clearing database"
User.destroy_all

5.times do |i|
  puts "== Creating user"
  user = User.create!(email: "user-#{i + 1}@email.com", name: Faker::Name.name, password: "123456")

  puts "== Creating 2 projects"
  2.times do
    project = Project.create!(
      user: user,
      title: "#{Faker::Appliance.equipment}, #{Faker::Appliance.equipment}, and #{Faker::Appliance.equipment}",
      description: Faker::Lorem.sentence(word_count: 80),
      status: Project::STATUSES.sample,
      estimated_level_of_effort: rand(1..10),
      actual_level_of_effort: rand(1..10)
    )

    puts "== Creating comments"
    User.all.each do |user|
      project.comments.create!(user: user, content: Faker::TvShows::SiliconValley.quote)
    end
  end
end