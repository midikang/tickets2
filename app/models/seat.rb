class Seat < ActiveRecord::Base
  belongs_to :flight
  validate :check_baggage_allowance
  
  private
    def check_baggage_allowance
      if baggage > flight.baggage_allowance
        errors.add(:baggage, "You have too much baggage")
      end
    end
end
