class Blog < ActiveRecord::Base
  has_one :BlogContent
  has_many :BlogComments
end
