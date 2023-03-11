# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning database for services"
Service.destroy_all
Chatroom.destroy_all

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"

puts "creating service 1"
Service.create!(name: "Up to 4 kg", description: lorem, price: 25)
puts "creating service 2"
Service.create!(name: "Up to 8 kg", description: lorem, price: 35)
puts "creating service 3"
Service.create!(name: "Up to 10 kg", description: lorem, price: 40)
puts "creating service 4"
Service.create!(name: "Up to 12 kg", description: lorem, price: 50)
puts "creating chatroom"
Chatroom.create!(name: "laundromate", id: "1")
puts "done creating services and chatroom"

puts "========================================="
