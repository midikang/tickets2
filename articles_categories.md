articles
  title
  content
  
categories
  name
  
article_categories
  article
  category
  
rails g model article title:string content:text
rails g model category name:string
rails g model article_category article:references category:references

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.references :article, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end


rake db:migrate


  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  
  create_table "article_categories", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "article_categories", ["article_id"], name: "index_article_categories_on_article_id"
  add_index "article_categories", ["category_id"], name: "index_article_categories_on_category_id"


## add has_many in article and category model
class Article < ActiveRecord::Base
  has_many :articleCategories
  has_many :categories, :through => :articleCategories
end

class Category < ActiveRecord::Base
  has_many :articleCategories
  has_many :articles, :through => :articleCategories
end

## add validate in article and category model
class Article < ActiveRecord::Base
  has_many :articleCategories
  has_many :categories, :through => :articleCategories
  
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end

class Category < ActiveRecord::Base
  has_many :articleCategories
  has_many :articles, :through => :articleCategories
  
  validates :name, presence: true, uniqueness: true
end

## add article controller and view
rails g controller articles index show new create

## add resources 
resources :articles
https://rails-midikang.c9users.io/articles
