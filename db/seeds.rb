# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.all
if u != []
  25.times do
    task = Task.create!(
      title: Faker::Lorem::sentence,
      created_at: Faker::Time.between(DateTime.now - 30, DateTime.now - 1),
      expected_end_date: Faker::Time.between(DateTime.now, DateTime.now + 30),
      user_id: "1",
    )
  end

  5.times do
    task = Task.create!(
      title: Faker::Lorem::sentence,
      created_at: Faker::Time.between(DateTime.now - 30, DateTime.now - 20),
      expected_end_date: Faker::Time.between(DateTime.now - 21, DateTime.now - 10),
      user_id: "1",
    )
  end

  puts "Seed finished"
  puts "Created #{Task.count} tasks"
else
  puts "You need to create one user before seeding the database."
  puts "Run `rails s`, connect to `localhost:3000` with your favourite browser."
  puts "Login to your local Blocitoff with your Google account."
  puts "After these passages you can seed the database with tasks. Bye."
end
