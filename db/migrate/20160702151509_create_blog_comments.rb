class CreateBlogComments < ActiveRecord::Migration
  def change
    create_table :blog_comments do |t|
      t.text :content
      t.integer :blog_id

      t.timestamps null: false
    end

    add_index :blog_comments, :blog_id
  end
end
