class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|

      t.integer :product_id, foreign_key: true, null: false
      t.integer :order_id, foreign_key: true, null: false
      t.integer :production_status, default: "0"
      t.integer :quantity, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
