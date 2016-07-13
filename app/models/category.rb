class Category < ActiveRecord::Base
  has_many :articleCategories
  has_many :articles, through: :articleCategories
  
	validates_uniqueness_of :name
end
