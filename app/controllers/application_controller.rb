class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/routes" do
    routes = Route.all
    routes.to_json(include: %i[vehicles drivers passengers])
  end

  get "/routes/:id" do
    route = Route.find(params[:id])
    route.to_json(
      only: %i[id origin destination],
      include: {
        vehicles: {
          only: %i[registration vehicle_type]
        }
      }
    )
  end

  get "/vehicles" do
    vehicles = Vehicle.all
    vehicles.to_json(include: :driver)
  end

  get "/vehicles/:id" do
    vehicle = Vehicle.find(params[:id])
    vehicle.to_json(
      only: %i[id registration vehicle_type],
      include: {
        driver: {
          only: [:name]
        },
        route: {
          only: %i[origin destination]
        }
      }
    )
  end

  get "/drivers" do
    drivers = Driver.all
    drivers.to_json(include: %i[vehicles routes])
  end

  get "/passengers" do
    pax = Passenger.all
    pax.to_json
  end
end
