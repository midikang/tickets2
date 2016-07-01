# Tickets2

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
  <div class="field">
    <%= f.label :flight_id %><br>
    <%= f.number_field :flight_id %>
  </div>