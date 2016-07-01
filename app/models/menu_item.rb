class MenuItem < ActiveRecord::Base
  belongs_to :menu
  validate :check_capicity
  
  private
    def check_capicity
      if menu.menuItems.size > menu.capacity
        errors.add(:name,"You can not add more than #{menu.capacity} menu items")
      end
    end
end
