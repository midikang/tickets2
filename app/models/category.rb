class Category < ActiveRecord::Base
  has_many :articleCategories
  has_many :articles, :through => :articleCategories
  
  validates :name, presence: true, uniqueness: true
end
