class Flight < ActiveRecord::Base
  has_many :seats
  accepts_nested_attributes_for :seats
end
