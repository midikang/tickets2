# Check assets paths
$ rails c
Running via Spring preloader in process 3562
Loading development environment (Rails 4.2.2)
>> Rails.application.config.assets.paths
=> ["/home/ubuntu/workspace/tryit/tickets2/app/assets/images", "/home/ubuntu/workspace/tryit/tickets2/app/assets/javascripts", "/home/ubuntu/workspace/tryit/tickets2/app/assets/stylesheets", "/home/ubuntu/workspace/tryit/tickets2/vendor/assets/javascripts", "/home/ubuntu/workspace/tryit/tickets2/vendor/assets/stylesheets", "/usr/local/rvm/gems/ruby-2.3.0/gems/twitter-bootstrap-rails-3.2.2/app/assets/fonts", "/usr/local/rvm/gems/ruby-2.3.0/gems/twitter-bootstrap-rails-3.2.2/app/assets/javascripts", "/usr/local/rvm/gems/ruby-2.3.0/gems/twitter-bootstrap-rails-3.2.2/app/assets/stylesheets", "/usr/local/rvm/gems/ruby-2.3.0/gems/twitter-bootstrap-rails-3.2.2/vendor/assets/stylesheets", "/usr/local/rvm/gems/ruby-2.3.0/gems/jquery-rails-4.1.1/vendor/assets/javascripts", "/usr/local/rvm/gems/ruby-2.3.0/gems/coffee-rails-4.1.1/lib/assets/javascripts", "/usr/local/rvm/gems/ruby-2.3.0/gems/turbolinks-source-5.0.0/lib/assets/javascripts"]
>> 