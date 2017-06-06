# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


1.times do
  u = User.create(email: "martinziserman@gmail.com", password: "aaaaaaaa",
    password_confirmation: "aaaaaaaa", first_name: "martin", last_name: "ziserman",
    avatar: "www.google.com", pseudo: "zarmilf", channel: "zarmilf_is_live")
  u.streams.create
  u = User.create(email: "ben@gmail.com", password: "aaaaaaaa",
    password_confirmation: "aaaaaaaa")
  u.streams.create
end
