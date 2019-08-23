# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Animal.destroy_all

20.times do |i|
  Animal.create!(
    name: Faker::Name.first_name,
    species: i % 3 == 0 ? "Dog" : "Cat",
    sex: i % 2 == 0 ? "M" : "F",
    birthday: Date.today - (Random.rand(1...17).year) - (Random.rand(365).day),
    description: Faker::Lorem.sentence,
    arrival_date: Date.today - (Random.rand(364).day)
  )
end
