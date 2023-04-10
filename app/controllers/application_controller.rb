class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add your routes here
  get "/routes" do
    routes = Route.all
    routes.to_json(include: %i[vehicles drivers passengers])
  end

  get "/vehicles" do
    vehicles = Vehicle.all
    vehicles.to_json(include: :driver)
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
