# paperclip

## add gem in Gemfile
```
gem "paperclip", "5.0.0"
```

```
bundle install
```


## scaffold friend
```
rails g scaffold friend name
```

## migration
```
rails g migration AddAvatarColumnsToFriend
```
(Or you can use migration generator: rails generate paperclip user avatar)



In your model:

  class User < ActiveRecord::Base
    attr_accessible :avatar
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  end
  
In your migrations:

  class AddAvatarColumnsToUsers < ActiveRecord::Migration
    def self.up
      add_attachment :users, :avatar
    end

    def self.down
      remove_attachment :users, :avatar
    end
  end  
  
  
In your controller:

  def create
    @user = User.create( params[:user] )
  end
In your show view:

  <%= image_tag @user.avatar.url %>
  <%= image_tag @user.avatar.url(:medium) %>
  <%= image_tag @user.avatar.url(:thumb) %>
To detach a file, simply set the attribute to nil:

  @user.avatar = nil
  @user.save  
  
  
## paperclip validation
Paperclip::Errors::MissingRequiredValidatorError in FriendsController#create

