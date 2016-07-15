class Category < ActiveRecord::Base
  has_many :articleCategories
  has_many :articles, through: :articleCategories
  
  has_many :links
  
	validates_uniqueness_of :name
end
