class Passenger < ActiveRecord::Base
  belongs_to :vehicle

  def driver
    self.vehicle.driver
  end

  def route
    self.vehicle.route
  end
end
