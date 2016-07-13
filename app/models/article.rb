class Article < ActiveRecord::Base
  has_many :articleCategories
  has_many :categories, :through => :articleCategories
  
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :categories, presence: true
end
