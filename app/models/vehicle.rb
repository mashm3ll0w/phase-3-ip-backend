class Vehicle < ActiveRecord::Base
  belongs_to :route
  belongs_to :driver
  has_many :passengers

  def senior_passenger
    self.passengers.select { |passenger| passenger.role == "Senior Passenger" }
  end

  def escort
    self.passengers.select { |passenger| passenger.role == "Escort" }
  end
end
