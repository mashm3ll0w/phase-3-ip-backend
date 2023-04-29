puts "🌱 Seeding routes..."
route1 = Route.create(origin: "Nairobi", destination: "Garissa")
route2 = Route.create(origin: "Nairobi", destination: "Mombasa")
route3 = Route.create(origin: "Wajir", destination: "Garissa")
route4 = Route.create(origin: "Nanyuki", destination: "Garissa")

puts "🌱 Seeding drivers..."

driver1 = Driver.create(name: "John")
driver2 = Driver.create(name: "Mash")
driver3 = Driver.create(name: "Lydia")
driver4 = Driver.create(name: "Alex")
driver5 = Driver.create(name: "Mike")

puts "🌱 Seeding vehicles..."

vehicle1 =
  Vehicle.create(
    registration: "00KA12",
    vehicle_type: "Land Cruiser",
    capacity: 5,
    driver_id: driver1.id,
    route_id: route1.id
  )
vehicle2 =
  Vehicle.create(
    registration: "00KA01",
    vehicle_type: "Land Rover",
    capacity: 5,
    driver_id: driver2.id,
    route_id: route1.id
  )
vehicle3 =
  Vehicle.create(
    registration: "00KA03",
    vehicle_type: "Isuzu FVZ",
    capacity: 3,
    driver_id: driver3.id,
    route_id: route2.id
  )
vehicle4 =
  Vehicle.create(
    registration: "00KA06",
    vehicle_type: "Bus",
    capacity: 5,
    driver_id: driver4.id,
    route_id: route3.id
  )
vehicle5 =
  Vehicle.create(
    registration: "00KA08",
    vehicle_type: "Subaru Outback",
    capacity: 4,
    driver_id: driver5.id,
    route_id: route4.id
  )

puts "🌱 Seeding passengers..."

pax1 = Passenger.create(name: "Brian", role: "Escort", vehicle_id: vehicle1.id)
pax2 =
  Passenger.create(
    name: "Jackson",
    role: "Senior Passenger",
    vehicle_id: vehicle1.id
  )
pax3 =
  Passenger.create(name: "Charles", role: "Passenger", vehicle_id: vehicle1.id)
pax4 =
  Passenger.create(name: "Gabriel", role: "Passenger", vehicle_id: vehicle1.id)
pax5 =
  Passenger.create(name: "Shawn", role: "Passenger", vehicle_id: vehicle1.id)

pax6 = Passenger.create(name: "Mary", role: "Escort", vehicle_id: vehicle2.id)
pax7 =
  Passenger.create(
    name: "Judy",
    role: "Senior Passenger",
    vehicle_id: vehicle2.id
  )
pax8 =
  Passenger.create(name: "Esther", role: "Passenger", vehicle_id: vehicle2.id)
pax9 =
  Passenger.create(name: "Edgar", role: "Passenger", vehicle_id: vehicle2.id)

pax10 = Passenger.create(name: "Frank", role: "Escort", vehicle_id: vehicle3.id)
pax11 =
  Passenger.create(
    name: "Esther",
    role: "Senior Passenger",
    vehicle_id: vehicle3.id
  )

pax12 = Passenger.create(name: "Fred", role: "Escort", vehicle_id: vehicle4.id)
pax13 =
  Passenger.create(
    name: "Caroline",
    role: "Senior Passenger",
    vehicle_id: vehicle4.id
  )
pax14 =
  Passenger.create(name: "Elisha", role: "Passenger", vehicle_id: vehicle4.id)

pax15 =
  Passenger.create(name: "Johnna", role: "Escort", vehicle_id: vehicle5.id)
pax16 =
  Passenger.create(
    name: "Rachael",
    role: "Senior Passenger",
    vehicle_id: vehicle5.id
  )

# Custom seeding for the Canopy-Caffe Project
# Before you give me stick for doing this, think about the effeciency, not having to do shit all over again
# Of course its going to be a nightmare to know what went wrong where but hey, we live in a crazy world huh?

CaffeItem.create(
  [
    {
      name: "Cappuccino",
      type_: "Coffee",
      price: 350,
      size: "large",
      description: "A Cappuccino a day keeps grumpy away!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    },
    {
      name: "Espresso",
      type_: "Coffee",
      price: 250,
      size: "small",
      description: "More Espressoo Less Depresso",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
    },
    {
      name: "Kenyan Tea",
      type_: "Tea",
      price: 250,
      size: "medium",
      description: "Karibu Chai!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"
    },
    {
      name: "Macha",
      type_: "Tea",
      price: 300,
      size: "medium",
      description: "You mean so Macha to me!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"
    },
    {
      name: "Orange",
      type_: "Juice",
      price: 350,
      size: "medium",
      description: "Squeeze out that creative juice!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"
    },
    {
      name: "Mango",
      type_: "Juice",
      price: 350,
      size: "medium",
      description: "The Juice is worth the squeeze!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/6.jpeg"
    },
    {
      name: "Chocolate Delight",
      type_: "Milkshake",
      price: 450,
      size: "large",
      description: "A little too much chocolate is just about right!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/7.jpeg"
    },
    {
      name: "Vanilla",
      type_: "Milkshake",
      price: 450,
      size: "large",
      description: "Milk shake it up!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/8.jpeg"
    },
    {
      name: "Puff Pastry",
      type_: "Pastry",
      price: 300,
      size: "small",
      description: "Life is better with freshly baked goods!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/9.jpeg"
    },
    {
      name: "Latte",
      type_: "Coffee",
      price: 350,
      size: "large",
      description: "I like you a Latte!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/712.jpeg"
    },
    {
      name: "Tamarind",
      type_: "Juice",
      price: 500,
      size: "large",
      description: "Who does not love ukwaju!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/56.jpeg"
    },
    {
      name: "Yoggo Yoggo",
      type_: "MilkShake",
      price: 550,
      size: "medium",
      description: "Shake up your taste buds!!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/187.jpeg"
    },
    {
      name: "Java ",
      type_: "Coffee",
      price: 250,
      size: "medium",
      description: "Kenya Halisi",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/72.jpeg"
    },
    {
      name: "Strong Tea",
      type_: "Tea",
      price: 100,
      size: "small",
      description: "Chai Yetu",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/21.jpeg"
    },
    {
      name: "Fanta Orange",
      type_: "Soda",
      price: 80,
      size: "small",
      description: "Kenya's favorite soda!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/70.jpeg"
    },
    {
      name: "Nesquick ",
      type_: "Tea",
      price: 600,
      size: "small",
      description: "Great Company!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/90.jpeg"
    },
    {
      name: "Macchiato",
      type_: "Coffee",
      price: 700,
      size: "small",
      description: "A Rare Taste!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/100.jpeg"
    },
    {
      name: "Malindicatto",
      type_: "Coffee",
      price: 700,
      size: "medium",
      description: "A floral summer coffee!",
      poster_url: "https://rickandmortyapi.com/api/character/avatar/77.jpeg"
    }
  ]
)

puts "✅ Done seeding!"
