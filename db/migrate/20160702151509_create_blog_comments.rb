class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.text :content
      t.integer :blog_id

      t.timestamps null: false
    end
  end
end
