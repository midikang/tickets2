class Person < ActiveRecord::Base
  has_many :addresses, inverse_of: :person
  accepts_nested_attributes_for :addresses
end
