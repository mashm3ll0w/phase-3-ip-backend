class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/" do
    message = {
      message: "Welcome to MovCon app",
      routes_available: [
        { get: "/routes" },
        { post: "/routes" },
        { get: "/routes/:id" },
        { delete: "/routes/:id" },
        { get: "/vehicles" },
        { get: "/vehicles/:id" },
        { get: "/passengers" },
        { get: "/passengers/:id" },
        { get: "/drivers" },
        { get: "/drivers/:id" }
      ]
    }
    message.to_json
  end

  # Add your routes here
  get "/routes" do
    routes = Route.all
    routes.to_json(include: %i[vehicles drivers passengers])
  end

  post "/routes" do
    # Create the route
    route =
      Route.create(
        origin: params[:origin].capitalize(),
        destination: params[:destination].capitalize()
      )
    # Create Driver
    driver = Driver.create(name: params[:driver].capitalize())
    # Create the vehicle
    vehicle =
      Vehicle.create(
        registration: params[:registration].upcase,
        vehicle_type: params[:vehicle_type].capitalize(),
        capacity: params[:capacity].to_i,
        route_id: route.id,
        driver_id: driver.id
      )
    # Create Passengers
    names_array = params[:passengers].split(" ").join("").split(",")
    escort =
      names_array
        .select do |name|
          name.split("-").length > 1 && name.split("-")[1] == "escort"
        end
        .join("")
        .split("-")[
        0
      ]
    senior_pax =
      names_array
        .select do |name|
          name.split("-").length > 1 && name.split("-")[1] == "senior"
        end
        .join("")
        .split("-")[
        0
      ]
    pax_names = names_array.select { |name| name.split("-").length == 1 }

    # Create escort
    if escort
      Passenger.create(
        name: escort.capitalize(),
        role: "Escort",
        vehicle_id: vehicle.id
      )
    else
      nil
    end
    if senior_pax
      Passenger.create(
        name: senior_pax.capitalize(),
        role: "Senior Passenger",
        vehicle_id: vehicle.id
      )
    else
      nil
    end

    pax_names.map do |name|
      Passenger.create(
        name: name.capitalize(),
        role: "Passenger",
        vehicle_id: vehicle.id
      )
    end

    route.to_json(include: { vehicles: { include: %i[driver passengers] } })
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

  # Custom methods for getting data for the CanopyCaffe App => https://app.netlify.com/sites/canopy-caffe/
  get "/caffe" do
    caffe_items = CaffeItem.all
    caffe_items.to_json
  end

  post "/caffe" do
    new_caffe_item =
      CaffeItem.create(
        name: params[:name],
        type_: params[:type],
        price: params[:price].to_i,
        size: params[:size],
        description: params[:description],
        poster_url: params[:poster_url]
      )
    new_caffe_item.to_json
  end

  get "/caffe/:id" do
    caffe_item = CaffeItem.find(params[:id])
    caffe_item.to_json
  end

  delete "/caffe/:id" do
    caffe_item = CaffeItem.find(params[:id])
    caffe_item.destroy
    { message: "Successfully deleted!" }.to_json
  end

  # Custom health route for the render hosting platform
  get "/health_check" do
    # status 200
    # {message: "The app is healthy"}.to_json
    halt 200, {message: "App is healthy"}.to_json
  end
end
