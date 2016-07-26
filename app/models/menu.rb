class Menu < ActiveRecord::Base
  has_many  :menuItems
  
  around_create :my_create_check
  
  after_initialize do |menu|
    puts "You have initialized an object!"
  end
 
  after_find do |menu|
    puts "You have found an object!"
  end
  
  protected
    def my_create_check
      puts "around_create an Menu object"
    end
  
end
