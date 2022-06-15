class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|

      t.integer :saunner_id, foreign_key: true, null: false
      t.integer :post_id, foreign_key: true
      t.string :name, null: false
      t.string :store_type, null: false
      t.string :target, null: false
      t.string :swap, null: false
      t.string :prefecture, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :tel, null: false
      t.string :hp, null: false
      t.string :access, null: false
      t.string :holiday, null: false
      t.string :open, null: false
      t.string :fee, null: false
      t.string :stove, null: false
      t.string :heat_source, null: false
      t.integer :sauna_temperature, null: false
      t.integer :sauna_capacity, null: false
      t.string :tv, null: false
      t.text :complement
      t.integer :mizu_temperature, null: false
      t.integer :mizu_capacity, null: false
      t.integer :depth, null: false
      t.string :vibra, null: false
      t.text :mizu_complement
      t.string :break_space, null: false
      t.string :air_bath, null: false
      t.string :chair, null: false
      t.integer :chair_quantity
      t.string :aufguss, null: false
      t.string :aufguss_frequency
      t.string :auto_loyly, null: false
      t.string :auto_loyly_frequency
      t.string :self_loyly, null: false
      t.string :inside_break_space, null: false
      t.string :wi_fi, null: false
      t.string :supply, null: false
      t.string :work_space, null: false
      t.string :restaurant, null: false
      t.string :parking, null: false
      t.string :dispenser, null: false
      t.string :oropo, null: false
      t.string :tattoo, null: false
      t.string :shampoo, null: false
      t.string :conditioner, null: false
      t.string :bodysoap, null: false
      t.string :facesoap, null: false
      t.string :razor, null: false
      t.string :toothbrush, null: false
      t.string :nylon_towell, null: false
      t.string :hairdryer, null: false
      t.string :facetowell, null: false
      t.string :bathtowell, null: false
      t.string :pants, null: false
      t.string :saunamat, null: false
      t.string :saunaboard, null: false
      t.text :free_text
      t.boolean :is_active, default: false


      t.timestamps
    end
  end
end
