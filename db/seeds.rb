# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "schyler", first_name: "schyler", last_name: "hosler", email: "schyler@mail.com", password: "password")
User.create(username: "vronnieli", first_name: "veronica", last_name: "li", email: "vronnieli@mail.com", password: "password")

Activity.create(name: "Eating")
Activity.create(name: "Shopping")

Location.create(city: "New York City")
Location.create(city: "Barcelona")

Day.create(day: 1)
Day.create(day: 2)
Day.create(day: 3)
Day.create(day: 4)
Day.create(day: 5)

Itinerary.create(name: "Trip through NYC")
Itinerary.create(name: "Hitting up Barca HARD")
