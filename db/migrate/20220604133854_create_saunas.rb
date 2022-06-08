class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|

      t.integer :saunner_id
      t.string :name
      t.string :store_type
      t.string :target
      t.string :swap
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
      t.string :tv
      t.text :complement
      t.integer :mizu_temperature
      t.integer :mizu_capacity
      t.integer :depth
      t.string :vibra
      t.string :break_space
      t.string :air_bath
      t.string :chair
      t.integer :chair_quantity
      t.string :aufguss
      t.string :aufguss_frequency
      t.string :auto_loyly
      t.string :auto_loyly_frequency
      t.string :self_loyly
      t.string :inside_break_space
      t.string :wi_fi
      t.string :supply
      t.string :work_space
      t.string :restaurant
      t.string :parking
      t.string :dispenser
      t.string :oropo
      t.string :tattoo
      t.string :shampoo
      t.string :conditioner
      t.string :bodysoap
      t.string :facesoap
      t.string :razor
      t.string :toothbrush
      t.string :nylon_towell
      t.string :hairdryer
      t.string :facetowell
      t.string :bathtowell
      t.string :pants
      t.string :saunamat
      t.string :saunaboard
      t.text :free_text
      t.boolean :is_active, default: false


      t.timestamps
    end
  end
end
