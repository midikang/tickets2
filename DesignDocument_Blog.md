# Design document - Blog

create with blog prefix while scaffold
## Model Design
blog
  title:string
  view_count:integer


blog_content
  blog_id:integer
  content:text

blog_comment
  blog_id:integer
  content:text

## create scaffold for blog, blog_content and blog_comment
rails generate scaffold blog title view_count:integer
rails generate scaffold blog_content content:text blog_id:integer
rails generate scaffold blog_comment content:text blog_id:integer

## rake db:migrate
http://localhost:3000/blogs/new
add partial to 'New Blog' view


# try customer order association
rails generate scaffold customer name
rails generate scaffold order order_date:datetime customer_id:integer

http://guides.rubyonrails.org/v4.2/association_basics.html

class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string  :name
      t.timestamps null: false
    end

    create_table :accounts do |t|
      t.integer :supplier_id
      t.string  :account_number
      t.timestamps null: false
    end

    add_index :accounts, :supplier_id
  end
end

Using t.integer :supplier_id makes the foreign key naming obvious and explicit. In current versions of Rails, you can abstract away this implementation detail by using t.references :supplier instead.

## in my code
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end

## Conclusion
- How to create a blog within one form
b1 = Blog.new(title:"My blog title1");
b1.create_BlogContent(content:"This is the content for My blog title1");
b1.save


# Log analysis
c = Customer.new(name:"EA")
c.save
(0.3ms)  begin transaction
SQL (31.7ms)  INSERT INTO "customers" ("name", "created_at", "updated_at") VALUES (?, ?, ?)  [["name", "EA"], ["created_at", "2016-07-02 23:42:20.027821"], ["updated_at", "2016-07-02 23:42:20.027821"]]
(1.4ms)  commit transaction
=> true

c = Customer.first
  Customer Load (0.3ms)  SELECT  "customers".* FROM "customers"  ORDER BY "customers"."id" ASC LIMIT 1
=> #<Customer id: 1, name: "EA", created_at: "2016-07-02 23:42:20", updated_at: "2016-07-02 23:42:20">
irb(main):014:0> c
=> #<Customer id: 1, name: "EA", created_at: "2016-07-02 23:42:20", updated_at: "2016-07-02 23:42:20">
irb(main):015:0> o = c.orders.first
  Order Load (0.3ms)  SELECT  "orders".* FROM "orders" WHERE "orders"."customer_id" = ?  ORDER BY "orders"."id" ASC LIMIT 1  [["customer_id", 1]]
=> nil


o = Order.new(customer_id:1, order_date:Time.now)
=> #<Order id: nil, order_date: "2016-07-02 23:50:15", customer_id: 1, created_at: nil, updated_at: nil>
irb(main):020:0> o.save
   (0.2ms)  begin transaction
  SQL (29.1ms)  INSERT INTO "orders" ("customer_id", "order_date", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["customer_id", 1], ["order_date", "2016-07-02 23:50:15.716930"], ["created_at", "2016-07-02 23:50:25.098497"], ["updated_at", "2016-07-02 23:50:25.098497"]]
   (19.7ms)  commit transaction
=> true


irb(main):021:0> first_order = Order.first
  Order Load (0.3ms)  SELECT  "orders".* FROM "orders"  ORDER BY "orders"."id" ASC LIMIT 1
=> #<Order id: 1, order_date: "2016-07-02 23:50:15", customer_id: 1, created_at: "2016-07-02 23:50:25", updated_at: "2016-07-02 23:50:25">
irb(main):022:0> @customer = Customer.first
  Customer Load (0.3ms)  SELECT  "customers".* FROM "customers"  ORDER BY "customers"."id" ASC LIMIT 1
=> #<Customer id: 1, name: "EA", created_at: "2016-07-02 23:42:20", updated_at: "2016-07-02 23:42:20">
irb(main):023:0> @customer.orders
  Order Load (0.2ms)  SELECT "orders".* FROM "orders" WHERE "orders"."customer_id" = ?  [["customer_id", 1]]
=> #<ActiveRecord::Associations::CollectionProxy [#<Order id: 1, order_date: "2016-07-02 23:50:15", customer_id: 1, created_at: "2016-07-02 23:50:25", updated_at: "2016-07-02 23:50:25">]>

irb(main):027:0> @customer.orders.size
=> 1

irb(main):028:0> my_order = @customer.orders.create(order_date:Time.now)
   (0.1ms)  begin transaction
  SQL (16.1ms)  INSERT INTO "orders" ("order_date", "customer_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["order_date", "2016-07-02 23:55:25.452047"], ["customer_id", 1], ["created_at", "2016-07-02 23:55:25.536193"], ["updated_at", "2016-07-02 23:55:25.536193"]]
   (18.7ms)  commit transaction
=> #<Order id: 2, order_date: "2016-07-02 23:55:25", customer_id: 1, created_at: "2016-07-02 23:55:25", updated_at: "2016-07-02 23:55:25">
irb(main):029:0> @customer.orders.size
=> 2

irb(main):030:0> Blog.first
  Blog Load (11.1ms)  SELECT  "blogs".* FROM "blogs"  ORDER BY "blogs"."id" ASC LIMIT 1
=> #<Blog id: 1, title: "Active Record Basics", view_count: nil, created_at: "2016-07-02 15:46:09", updated_at: "2016-07-02 15:46:09">
irb(main):031:0> b1 = Blog.first
  Blog Load (0.3ms)  SELECT  "blogs".* FROM "blogs"  ORDER BY "blogs"."id" ASC LIMIT 1
=> #<Blog id: 1, title: "Active Record Basics", view_count: nil, created_at: "2016-07-02 15:46:09", updated_at: "2016-07-02 15:46:09">

rb(main):032:0> b1.create_BlogContent
b1.create_BlogContent  b1.create_BlogContent!
irb(main):032:0> b1.create_BlogContent(content:"has_one association has create_association method")
   (0.1ms)  begin transaction
  SQL (13.1ms)  INSERT INTO "blog_contents" ("content", "blog_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["content", "has_one association has create_association method"], ["blog_id", 1], ["created_at", "2016-07-03 00:00:21.784147"], ["updated_at", "2016-07-03 00:00:21.784147"]]
   (1.3ms)  commit transaction
  BlogContent Load (0.3ms)  SELECT  "blog_contents".* FROM "blog_contents" WHERE "blog_contents"."blog_id" = ? LIMIT 1  [["blog_id", 1]]
=> #<BlogContent id: 1, content: "has_one association has create_association method", blog_id: 1, created_at: "2016-07-03 00:00:21", updated_at: "2016-07-03 00:00:21">


irb(main):033:0> b1
=> #<Blog id: 1, title: "Active Record Basics", view_count: nil, created_at: "2016-07-02 15:46:09", updated_at: "2016-07-02 15:46:09">

Loading development environment (Rails 4.2.2)
irb(main):001:0> b1 = Blog.first
  Blog Load (0.2ms)  SELECT  "blogs".* FROM "blogs"  ORDER BY "blogs"."id" ASC LIMIT 1
=> nil
irb(main):002:0> b1=Blog.new(title:"First Blog")
=> #<Blog id: nil, title: "First Blog", view_count: nil, created_at: nil, updated_at: nil>
irb(main):003:0> b1.save
   (0.2ms)  begin transaction
  SQL (0.7ms)  INSERT INTO "blogs" ("title", "created_at", "updated_at") VALUES (?, ?, ?)  [["title", "First Blog"], ["created_at", "2016-07-03 00:21:08.735246"], ["updated_at", "2016-07-03 00:21:08.735246"]]
   (1.1ms)  commit transaction
=> true
irb(main):004:0> b1.
Display all 423 possibilities? (y or n)
irb(main):004:0> b1.b
b1.becomes                         b1.before_add_for_BlogComments?    b1.blank?
b1.becomes!                        b1.before_remove_for_BlogComments  b1.build_BlogContent
b1.before_add_for_BlogComments     b1.before_remove_for_BlogComments= b1.byebug
b1.before_add_for_BlogComments=    b1.before_remove_for_BlogComments?
irb(main):004:0> b1.build_BlogContent(blog_content:"I did it!")
ActiveRecord::InverseOfAssociationNotFoundError: Could not find the inverse association for BlogContent (:blog in BlogContent)
	from /Users/ad/git/ror/tickets2/path/ruby/2.0.0/gems/activerecord-4.2.2/lib/active_record/reflection.rb:337:in `check_validity_of_inverse!'
