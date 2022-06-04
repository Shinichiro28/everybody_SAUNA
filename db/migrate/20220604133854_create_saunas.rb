class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|

      t.integer :saunner_id
      t.string :name
      t.string :type
      t.boolean :target, default: true
      t.boolean :swap, default: false
      t.string :prefecture
      t.string :postcode
      t.string :address
      t.string :tel
      t.string :hp
      t.string :access
      t.string :holiday
      t.string :open
      t.string :fee
      t.string :stove
      t.string :heat_source
      t.integer :sauna_temperature
      t.integer :sauna_capacity
      t.boolean :tv, default: false
      t.text :complement
      t.integer :mizu_temperature
      t.integer :mizu_capacity
      t.integer :depth
      t.boolean :vibra, default: false
      t.boolean :break_space, default: false
      t.boolean :air_bath, default: false
      t.string :chair
      t.integer :chair_quantity
      t.boolean :aufguss, default: false
      t.string :aufguss_frequency
      t.boolean :auto_loyly, default: false
      t.string :auto_loyly_frequency
      t.boolean :self_loyly, default: false
      t.boolean :inside_break_space, default: false
      t.boolean :wi_fi, default: false
      t.boolean :supply, default: false
      t.boolean :work_space, default: false
      t.boolean :restaurant, default: false
      t.boolean :parking, default: false
      t.boolean :dispenser, default: false
      t.boolean :oropo, default: false
      t.boolean :tattoo, default: false
      t.boolean :shampoo, default: false
      t.boolean :conditioner, default: false
      t.boolean :bodysoap, default: false
      t.boolean :facesoap, default: false
      t.boolean :razor, default: false
      t.boolean :toothbrush, default: false
      t.boolean :nylon_towel, default: false
      t.boolean :hairdryer, default: false
      t.boolean :facetowel, default: false
      t.boolean :bathtowell, default: false
      t.boolean :pants, default: false
      t.boolean :saunamat, default: false
      t.boolean :saunaboard, default: false
      t.text :free_text
      t.boolean :is_active, default: false


      t.timestamps
    end
  end
end
