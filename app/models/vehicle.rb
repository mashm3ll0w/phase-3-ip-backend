class Vehicle < ActiveRecord::Base
  belongs_to :route
  belongs_to :driver
  has_many :passengers
end
