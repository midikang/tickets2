Started POST "/flights" for 211.160.167.138 at 2016-07-08 15:59:20 +0800
Cannot render console from 211.160.167.138! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
Processing by FlightsController#create as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"qVvZ8znv7AgOEcN/tEYKTGI6lgCq8wO/09gjeuhalIQjr0lMlimr6gnGBIiAluClaaRQPdUPd3t3rouEUKy/qg==", "flight"=>{"departure(1i)"=>"2016", "departure(2i)"=>"7", "departure(3i)"=>"8", "departure(4i)"=>"15", "departure(5i)"=>"58", "arrival(1i)"=>"2016", "arrival(2i)"=>"7", "arrival(3i)"=>"8", "arrival(4i)"=>"15", "arrival(5i)"=>"58", "destination"=>"Hello", "baggage_allowance"=>"30", "capacity"=>"100", "seats_attributes"=>{"0"=>{"name"=>"ss1", "baggage"=>"1"}, "1"=>{"name"=>"ss2", "baggage"=>"2"}, "2"=>{"name"=>"ss3", "baggage"=>"3"}, "3"=>{"name"=>"ss4", "baggage"=>"4"}}}, "commit"=>"Create Flight"}
   (0.2ms)  begin transaction
  SQL (2.5ms)  INSERT INTO "flights" ("destination", "baggage_allowance", "capacity", "departure", "arrival", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?, ?)  [["destination", "Hello"], ["baggage_allowance", 30.0], ["capacity", 100], ["departure", "2016-07-08 07:58:00.000000"], ["arrival", "2016-07-08 07:58:00.000000"], ["created_at", "2016-07-08 07:59:20.265290"], ["updated_at", "2016-07-08 07:59:20.265290"]]
  SQL (0.3ms)  INSERT INTO "seats" ("name", "baggage", "flight_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "ss1"], ["baggage", 1.0], ["flight_id", 9], ["created_at", "2016-07-08 07:59:20.271509"], ["updated_at", "2016-07-08 07:59:20.271509"]]
  SQL (0.2ms)  INSERT INTO "seats" ("name", "baggage", "flight_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "ss2"], ["baggage", 2.0], ["flight_id", 9], ["created_at", "2016-07-08 07:59:20.274670"], ["updated_at", "2016-07-08 07:59:20.274670"]]
  SQL (0.1ms)  INSERT INTO "seats" ("name", "baggage", "flight_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "ss3"], ["baggage", 3.0], ["flight_id", 9], ["created_at", "2016-07-08 07:59:20.277676"], ["updated_at", "2016-07-08 07:59:20.277676"]]
  SQL (0.1ms)  INSERT INTO "seats" ("name", "baggage", "flight_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["name", "ss4"], ["baggage", 4.0], ["flight_id", 9], ["created_at", "2016-07-08 07:59:20.280013"], ["updated_at", "2016-07-08 07:59:20.280013"]]
   (18.9ms)  commit transaction
Redirected to https://rails-midikang.c9users.io/flights/9
Completed 302 Found in 50ms (ActiveRecord: 22.3ms)


Started GET "/flights/9" for 211.160.167.138 at 2016-07-08 15:59:20 +0800
Cannot render console from 211.160.167.138! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
Processing by FlightsController#show as HTML
  Parameters: {"id"=>"9"}
  Flight Load (0.3ms)  SELECT  "flights".* FROM "flights" WHERE "flights"."id" = ? LIMIT 1  [["id", 9]]
  Seat Load (0.3ms)  SELECT "seats".* FROM "seats" WHERE "seats"."flight_id" = ?  [["flight_id", 9]]
  Rendered flights/_seat_list.html.erb (5.5ms)
  Rendered flights/_new_seat.html.erb (3.2ms)
  Rendered flights/show.html.erb within layouts/application (18.0ms)
Completed 200 OK in 102ms (Views: 99.2ms | ActiveRecord: 0.6ms)
