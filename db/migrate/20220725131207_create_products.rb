class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|

      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :genre_id,  foreign_key: true, null: false
      t.integer :price, null: false
      t.boolean :is_active,  default: true

      t.timestamps
    end
  end
end
