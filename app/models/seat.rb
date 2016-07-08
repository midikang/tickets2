class Seat < ActiveRecord::Base
  belongs_to :flight
  validate :check_booking
  
  private
    def check_booking
      if !flight.nil?  && baggage > flight.baggage_allowance
        errors.add(:baggage, "You have too much baggage")
      end
      
      if !flight.nil?  && flight.seats.size >= flight.capacity
        errors.add(:name,"The flight is fully booked")
      end
    end
end
