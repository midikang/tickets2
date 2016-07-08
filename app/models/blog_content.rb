class BlogContent < ActiveRecord::Base
  belongs_to :blog, inverse_of: :blogContent
end
