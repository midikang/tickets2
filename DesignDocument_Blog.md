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
