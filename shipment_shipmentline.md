# shipment and shipment lines

```
rails g scaffold shipment customer_name
rails g scaffold shipment_line shipment_id:integer line_no:integer item_id quantity:integer 
```

Started POST "/shipments" for 211.160.167.138 at 2016-07-08 16:08:12 +0800
Cannot render console from 211.160.167.138! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
Processing by ShipmentsController#create as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"IKN7nA2s9NtmbIH+UMK/KOdFPlOrJG0Xeu0HasBl2I6qV+sjomqzOWG7RglkElXB7Nv4btTYGdPem6+UeJPzoA==", "shipment"=>{"customer_name"=>"TA", "shipmentLines_attributes"=>{"0"=>{"line_no"=>"1", "item_id"=>"ITEM1", "quantity"=>"1"}, "1"=>{"line_no"=>"2", "item_id"=>"ITEM2", "quantity"=>"2"}, "2"=>{"line_no"=>"3", "item_id"=>"ITEM3", "quantity"=>"3"}, "3"=>{"line_no"=>"", "item_id"=>"", "quantity"=>""}, "4"=>{"line_no"=>"", "item_id"=>"", "quantity"=>""}, "5"=>{"line_no"=>"", "item_id"=>"", "quantity"=>""}, "6"=>{"line_no"=>"", "item_id"=>"", "quantity"=>""}, "7"=>{"line_no"=>"", "item_id"=>"", "quantity"=>""}, "8"=>{"line_no"=>"", "item_id"=>"", "quantity"=>""}, "9"=>{"line_no"=>"", "item_id"=>"", "quantity"=>""}}}, "commit"=>"Create Shipment"}
Unpermitted parameter: shipmentLines_attributes
   (0.1ms)  begin transaction
  SQL (0.6ms)  INSERT INTO "shipments" ("customer_name", "created_at", "updated_at") VALUES (?, ?, ?)  [["customer_name", "TA"], ["created_at", "2016-07-08 08:08:12.873146"], ["updated_at", "2016-07-08 08:08:12.873146"]]
   (14.6ms)  commit transaction
Redirected to https://rails-midikang.c9users.io/shipments/3
Completed 302 Found in 24ms (ActiveRecord: 15.3ms)
