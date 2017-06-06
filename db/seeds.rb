# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1.times do
  u = User.create(
    email: "martinziserman@gmail.com",
    password: "password",
    password_confirmation: "password",
    first_name: "martin",
    last_name: "ziserman",
    avatar: "www.google.com",
    pseudo: "zarmilf",
    channel: "ogaminglol"
  )
  u.streams.create


  u = User.create(
    email: "ben@gmail.com",
    password: "password",
    password_confirmation: "password",
    first_name: "martin",
    last_name: "ziserman",
    avatar: "www.google.com",
    pseudo: "zarmilf",
    channel: "ogaminglol",
    live: true
  )

  u = User.create(
    email: "pauline@gmail.com",
    password: "password",
    password_confirmation: "password",
    first_name: "Pauline",
    last_name: "ziserman",
    avatar: "www.google.com",
    pseudo: "zarmilf",
    channel: "ogaminglol",
    live: true
  )

  u = User.create(
    email: "matthieu@gmail.com",
    password: "password",
    password_confirmation: "password",
    first_name: "Matthieu",
    last_name: "Taveneau",
    avatar: "www.google.com",
    pseudo: "zarmilf",
    channel: "ogaminglol",
    live: true
  )
  u.streams.create()
end
