class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.integer :view_count

      t.timestamps null: false
    end
  end
end
