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

puts "✅ Done seeding!"
