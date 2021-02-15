# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Participation.destroy_all
Event.destroy_all
User.destroy_all

10.times do
  User.create(
    email: "ducon@yopmail.com", # Faker::Internet.email(domain: 'yopmail.com'),
    encrypted_password: "1234", 
    description: Faker::Movies::HarryPotter.quote,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
puts "10 User"

location = ["Paris", "Bordeaux", "Marseille", "NY", "Vezoul", "Bagneux"]
duration = [5, 10, 20, 25, 30, 45, 55]

10.times do
Event.create(
  start_date: Faker::Date.between(from: Time.now, to: 1.month.from_now),
  duration: duration.sample,
  title: Faker::Game.title,
  description: Faker::Lorem.words(number: 21),
  price: Faker::Number.between(from: 1, to: 1000),
  location: location.sample
)
end
puts " 10 Event"

10.times do
Participation.create(
  user_id: User.all.sample.id,
  event_id: Event.all.sample.id
)
end
puts " 10 Participation"