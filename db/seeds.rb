# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create({name: "User", description: "Its for normal user"})
Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

User.create({email: "admin@example.com", password: "admin123", password_confirmation: "admin123", role_id: Role.last.id})
User.create({email: "user@example.com", password: "user123", password_confirmation: "user123", role_id: Role.first.id})
User.create({email: "user1@example.com", password: "user123", password_confirmation: "user123", role_id: Role.first.id})

