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

