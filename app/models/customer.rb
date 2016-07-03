class Customer < ActiveRecord::Base
  has_many  :orders, inverse_of: :customer
end
