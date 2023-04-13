class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/routes" do
    routes = Route.all
    routes.to_json(include: %i[vehicles drivers passengers])
  end

  post "/routes" do
    # Create the route
    route =
      Route.create(origin: params[:origin], destination: params[:destination])
    # Create Driver
    driver = Driver.create(name: params[:driver])
    # Create the vehicle
    vehicle =
      Vehicle.create(
        registration: params[:registration],
        vehicle_type: params[:vehicle_type],
        capacity: params[:capacity].to_i,
        route_id: route.id,
        driver_id: driver.id
      )
    # Create Passengers
    names = params[:passengers].split(" ").join("")
    names_array = names.split(",")
    names_array.map do |name|
      Passenger.create(name: name, role: "Passenger", vehicle_id: vehicle.id)
    end

    vehicle.to_json
  end

  get "/routes/:id" do
    route = Route.find(params[:id])
    route.to_json(include: { vehicles: { include: %i[driver passengers] } })
  end

  delete "/routes/:id" do
    route = Route.find(params[:id])
    vehicles = Vehicle.all.select { |vehicle| vehicle.route_id == route.id }
    vehicle_ids = vehicles.map { |vehicle| vehicle.id }

    # Find all passengers
    passengers =
      vehicle_ids
        .map do |id|
          Passenger.all.select { |passenger| passenger.vehicle_id == id }
        end
        .flatten

    # Delete the route, the vehicle and the passengers
    route.destroy
    vehicles.map { |vehicle| vehicle.destroy }
    passengers.map { |passenger| passenger.destroy }
    { message: "Route and dependencies deleted!" }.to_json
  end

  get "/vehicles" do
    vehicles = Vehicle.all
    vehicles.to_json(include: %i[driver route])
  end

  get "/vehicles/:id" do
    vehicle = Vehicle.find(params[:id])
    vehicle.to_json(
      only: %i[id registration vehicle_type capacity],
      include: {
        driver: {
          only: [:name]
        },
        route: {
          only: %i[origin destination created_at]
        },
        passengers: {
          only: %i[name role]
        }
      }
    )
  end

  get "/drivers" do
    drivers = Driver.all
    drivers.to_json(include: %i[vehicles routes])
  end

  get "/drivers/:id" do
    driver = Driver.find(params[:id])
    driver.to_json(
      include: {
        vehicles: {
          only: %i[registration vehicle_type],
          include: {
            route: {
              only: %i[origin destination]
            }
          }
        }
      }
    )
  end

  get "/passengers" do
    pax = Passenger.all
    pax.to_json(include: { vehicle: { include: :route } })
  end

  get "/passengers/:id" do
    passenger = Passenger.find(params[:id])
    passenger.to_json(
      only: %i[id name role],
      include: {
        vehicle: {
          only: %i[registration, vehicle_type],
          include: {
            driver: {
              only: [:name]
            },
            route: {
              only: %i[origin destination]
            }
          }
        }
      }
    )
  end
end
