class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :saunner_id, foreign_key: true, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :total_price, null: false
      t.integer :shipping_fee, null: false
      t.integer :payment_method, default: "0", null: false
      t.integer :order_status, defult: "0", null: false

      t.timestamps
    end
  end
end
