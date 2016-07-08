class Flight < ActiveRecord::Base
  has_many :seats, dependent: :destroy
  
  accepts_nested_attributes_for :seats
end
