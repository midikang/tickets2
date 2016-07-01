class Seat < ActiveRecord::Base
  validate :check_baggage_allowance
  
  private
    def check_baggage_allowance
      if baggage > Flight.find(flight_id).baggage_allowance
        errors.add(:baggage, "You have too much baggage")
      end
    end
end
