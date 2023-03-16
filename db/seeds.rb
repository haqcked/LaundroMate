# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning database for services and chatroom"
Service.destroy_all

lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
c1 = "Wash, Dry and Fold"
c2 = "Wash, Dry and Iron"
c3 = "Iron"

puts "creating category 1 services"
Service.create(category: c1, name: "Up to 2 kg", description: lorem, price: 10)
Service.create(category: c1, name: "Up to 4 kg", description: lorem, price: 25)
Service.create(category: c1, name: "Up to 8 kg", description: lorem, price: 35)
Service.create(category: c1, name: "Up to 12 kg", description: lorem, price: 50)

puts "creating category 2 services"
Service.create(category: c2, name: "Up to 2 kg", description: lorem, price: 25)
Service.create(category: c2, name: "Up to 4 kg", description: lorem, price: 40)
Service.create(category: c2, name: "Up to 8 kg", description: lorem, price: 70)
Service.create(category: c2, name: "Up to 12 kg", description: lorem, price: 90)

puts "creating category 3 services"
Service.create(category: c3, name: "Up to 2 kg", description: lorem, price: 28)
Service.create(category: c3, name: "Up to 4 kg", description: lorem, price: 32)
Service.create(category: c3, name: "Up to 8 kg", description: lorem, price: 56)
Service.create(category: c3, name: "Up to 12 kg", description: lorem, price: 72)

puts "=========================================="

puts "cleaning Admin database"
User.where(admin: true).destroy_all

User.create!(
  first_name: "admin",
  last_name: "admin",
  nickname: "admin",
  email: "admin@admin.com",
  address: "Brussels",
  password: "123456",
  admin: true,
)

puts "cleaning Message database"
Message.destroy_all

# puts "creating laundromate chatroom"
# Chatroom.create!(name: "laundromate")
# puts "========================================="

puts "done creating admin and services"
