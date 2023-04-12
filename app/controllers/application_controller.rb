class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/routes" do
    routes = Route.all
    routes.to_json(include: %i[vehicles drivers passengers])
  end

  get "/routes/:id" do
    route = Route.find(params[:id])
    route.to_json(include: { vehicles: { include: %i[driver passengers] } })
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
