class Route < ActiveRecord::Base
  has_many :vehicles
  has_many :drivers, through: :vehicles
  has_many :passengers, through: :vehicles
end
