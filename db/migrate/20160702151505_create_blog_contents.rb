class CreateBlogContents < ActiveRecord::Migration
  def change
    create_table :blog_contents do |t|
      t.text :content
      t.integer :blog_id

      t.timestamps null: false
    end
  end
end
