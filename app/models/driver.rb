class Driver < ActiveRecord::Base
  has_many :vehicles
  has_many :passengers, through: :vehicles
  has_many :routes, through: :vehicles
end
