# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  task = Task.create!(
    title: Faker::Lorem::sentence,
    expected_end_date: Faker::Time.between(DateTime.now - 30, DateTime.now + 30),
    user_id: "1",
  )
end

puts "Seed finished"
puts "Created #{Task.count} tasks"
