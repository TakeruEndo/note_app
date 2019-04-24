# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

book    = Book.create(
  title: "新劇の", authors: "袖山",
)
book2    = Book.create(
    title: "ガンダム", authors: "がん・ダム",
)