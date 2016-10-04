# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "schyler", first_name: "schyler", last_name: "hosler", email: "schyler@mail.com", password: "password")
u2 = User.create(username: "vronnieli", first_name: "veronica", last_name: "li", email: "vronnieli@mail.com", password: "password")

a1 = Activity.create(name: "Eating")
a2 = Activity.create(name: "Shopping")

l1 = Location.create(city: "New York City")
l2 = Location.create(city: "Boston")
l3 = Location.create(city: "Seville")
l4 = Location.create(city: "Barcelona")

da1 = Day.create(day: 1)
da2 = Day.create(day: 2)
da3 = Day.create(day: 3)
db1 = Day.create(day: 1)
db2 = Day.create(day: 2)

i1 = Itinerary.create(name: "Eastcoast Trip")
i2 = Itinerary.create(name: "South of Spain")

u1.itineraries << i1
u1.itineraries[0].days << da1
u1.itineraries[0].days << da2
u1.itineraries[0].days << da3
u1.itineraries[0].days[0].locations.concat([l1, l2])
u1.itineraries[0].days[0].locations[0].activities << a1
u1.itineraries[0].days[1].locations << l2
u1.itineraries[0].days[1].locations[0].activities << a1

u2.itineraries << i2
u2.itineraries[0].days << db1
u2.itineraries[0].days << db2
u2.itineraries[0].days[0].locations.concat([l3, l4])
u2.itineraries[0].days[0].locations[0].activities << a1
u2.itineraries[0].days[1].locations << l4
u2.itineraries[0].days[1].locations[0].activities << a2

u1.itineraries << i2

