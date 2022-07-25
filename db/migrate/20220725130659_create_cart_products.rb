class CreateCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_products do |t|

      t.integer :saunner_id, foreign_key: true, null: false
      t.integer :product_id, foreign_key: true, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
