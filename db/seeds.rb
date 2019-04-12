# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Micropost.destroy_all
Micropost.create(content: "test", user_id: 1, fav_count: 5)
Micropost.create(content: "test2", user_id: 2, fav_count: 15)
Micropost.create(content: "test3", user_id: 3, fav_count: 25)
Micropost.create(content: "test4", user_id: 4, fav_count: 35)