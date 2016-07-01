class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menu_id
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
