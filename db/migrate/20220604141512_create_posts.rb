class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :saunner_id, null: false
      t.integer :sauna_id, null: false
      t.date :visit_date, null: false
      t.integer :sauna_minutes, null: false
      t.integer :mizu_minutes, null: false
      t.integer :totonoi_minutes, null: false
      t.integer :sauna_times, null: false
      t.text :sauna_post
      t.string :food_name
      t.text :food_post
      t.integer :sauna_temperature
      t.integer :mizu_temperature
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
