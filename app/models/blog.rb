class Blog < ActiveRecord::Base
  has_one :blogContent, inverse_of: :blog
  has_many :blogComments, inverse_of: :blog
end
