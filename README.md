# Tickets2

Demonstrate model association
keyword: has_many, belongs_to, validate, parial,render

## steps


rails g scaffold flight departure:datetime arrival:datetime destination:string baggage_allowance:decimal capacity:integer

rails g scaffold seat flight_id:integer name:string baggage:decimal


$ rake routes
     Prefix Verb   URI Pattern                 Controller#Action
      seats GET    /seats(.:format)            seats#index
            POST   /seats(.:format)            seats#create
   new_seat GET    /seats/new(.:format)        seats#new
  edit_seat GET    /seats/:id/edit(.:format)   seats#edit
       seat GET    /seats/:id(.:format)        seats#show
            PATCH  /seats/:id(.:format)        seats#update
            PUT    /seats/:id(.:format)        seats#update
            DELETE /seats/:id(.:format)        seats#destroy
    flights GET    /flights(.:format)          flights#index
            POST   /flights(.:format)          flights#create
 new_flight GET    /flights/new(.:format)      flights#new
edit_flight GET    /flights/:id/edit(.:format) flights#edit
     flight GET    /flights/:id(.:format)      flights#show
            PATCH  /flights/:id(.:format)      flights#update
            PUT    /flights/:id(.:format)      flights#update
            DELETE /flights/:id(.:format)      flights#destroy

$ rake db:migrate

    config.time_zone = 'Beijing'

## create new seat parial for flights/1 url
_new_seat.html.erb

```
<h1>New Seat</h1>

<%= form_for(@seat) do |f| %>
  <% if @seat.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@seat.errors.count, "error") %> prohibited this seat from being saved:</h2>

      <ul>
      <% @seat.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :flight_id %><br>
    <%= f.number_field :flight_id %>
  </div>
  <div class="field">
    <%= f.label :name %><br>
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :baggage %><br>
    <%= f.text_field :baggage %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>


```

# call _new_seat.html.erb in app/views/flights/show.html.erb
```
<%= render :partial=>"new_seat" %>
```

#create seat variable in FlightsController in method show
change instance variable @seat to local variable seat in _new_seat.html.erb
```
<h1>New Seat</h1>

<%= form_for(seat) do |f| %>
  <% if seat.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(seat.errors.count, "error") %> prohibited this seat from being saved:</h2>

      <ul>
      <% seat.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="field">
    <%= f.label :flight_id %><br>
    <%= f.number_field :flight_id %>
  </div>
  <div class="field">
    <%= f.label :name %><br>
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :baggage %><br>
    <%= f.text_field :baggage %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>

```

## pass local variable seat in app/views/flights/show.html.erb
<%= render :partial=>"new_seat", :locals=>{:seat=>Seat.new(:flight_id=>@flight.id)} %>

## remove flight_id from _new_seat.html.erb
```
  <div class="field">
    <%= f.label :flight_id %><br>
    <%= f.number_field :flight_id %>
  </div>
```

## add hidden_field in _new_seat.html.erb
```
<%= f.hidden_field :flight_id %>
```

# add _seat_list.html.erb
copy from views/seats/index.html.erb
remove
```
<th>Flight</th>
<td><%= seat.flight_id %></td>
<%= link_to 'New Seat', new_seat_path %>
```
instance variable to local variable
rename @seats to seats

## in app/views/flights/show.html.erb
<%= render :partial=>"seat_list", :locals=>{:seats=>Seat.all} %>


## 
<%= render :partial=>"seat_list", :locals=>{:seats=>Seat.find_all_by_flight_id(@flight.id)} %>

undefined method `find_all_by_flight_id' for

## add has_many for model flight
```
class Flight < ActiveRecord::Base
  has_many :seats
end
```

in app/views/flights/show.html.erb
<%= render :partial=>"seat_list", :locals=>{:seats=>@flight.seats} %>


# create menu and menu_item


rails g scaffold menu name:string capacity:integer

rails g scaffold menu_item menu_id:integer name:string url:string

rake db:migrate

## show 'new menu item' in /menus/1


# Building Complex Forms
9.1 Configuring the Model

Active Record provides model level support via the accepts_nested_attributes_for method:

class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses
end
 
class Address < ActiveRecord::Base
  belongs_to :person
end
 
9.2 Nested Forms

The following form allows a user to create a Person and its associated addresses.

<%= form_for @person do |f| %>
  Addresses:
  <ul>
    <%= f.fields_for :addresses do |addresses_form| %>
      <li>
        <%= addresses_form.label :kind %>
        <%= addresses_form.text_field :kind %>
 
        <%= addresses_form.label :street %>
        <%= addresses_form.text_field :street %>
        ...
      </li>
    <% end %>
  </ul>
<% end %>
 
my code
```
rails g scaffold person name
rails g scaffold address kind street

```

# link

rails g model link name url category:reference


# add bootstrap
gem 'therubyracer', platforms: :ruby
gem 'less-rails'
gem 'twitter-bootstrap-rails'

bundle install
rails g bootstrap:install
```
Running via Spring preloader in process 18832
      insert  app/assets/javascripts/application.js
      create  app/assets/javascripts/bootstrap.js.coffee
      create  app/assets/stylesheets/bootstrap_and_overrides.css.less
      create  config/locales/en.bootstrap.yml
        gsub  app/assets/stylesheets/application.css
```
rails g bootstrap:layout

rails g bootstrap:themed Traces        


rails g bootswatch:install cerulean # 安装该 theme 的基础文件
rails g bootswatch:import cerulean # 导入一个线上的 theme 的变量文件

我们修改一下 application.css 中的引用：

 *= require cerulean/loader
 *= require cerulean/bootswatch