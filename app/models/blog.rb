class Blog < ActiveRecord::Base
  has_one :blogContent, inverse_of: :blog, dependent: :destroy
  has_many :blogComments, dependent: :destroy
  
  accepts_nested_attributes_for :blogContent
end
