class CreateBlogContents < ActiveRecord::Migration
  def change
    create_table :blog_contents do |t|
      t.text :content
      t.integer :blog_id

      t.timestamps null: false
    end

    add_index :blog_contents, :blog_id
  end
end
