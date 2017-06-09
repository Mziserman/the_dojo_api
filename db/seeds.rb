# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
SubCategory.delete_all
User.delete_all
Stream.delete_all


categories = ["Design", "Motion", "Photographie"]
channel = ["a_seagull", "Alderiate", "ogaminglol", "learnsquare", "eclypsiatvlol"]

Design = ["Photoshop", "Illustrator"]
Motion = ["After Effect", "Widows Movie Maker"]
Photographie  = ["Instagram", "Olol jsp"]

boris = User.create(
  email: "boris@gmail.com",
  password: "password",
  password_confirmation: "password",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  avatar: "http://thecatapi.com/api/images/get?format=src&type=jpg",
  pseudo: Faker::Name.first_name,
  channel: 'ogaminglol',
  live: true
)

categories.each do |category|
  cat = Category.create(name: category)

  eval(category).each do |soft|
    SubCategory.create(name: soft, category_id: cat.id)
  end
  i = 0
  5.times do
    u = User.create(
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      avatar: "http://thecatapi.com/api/images/get?format=src&type=jpg",
      pseudo: Faker::Name.first_name,
      channel: channel[i],
      live: true
    )
    u.streams.create(
      name: Faker::Name.name,
      category: cat,
      description: Faker::Lorem.paragraph
    )
    i += 1
  end
end

10.times do
  u = User.create(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    avatar: "http://thecatapi.com/api/images/get?format=src&type=jpg",
    pseudo: Faker::Name.first_name,
    live: false
  )
end
