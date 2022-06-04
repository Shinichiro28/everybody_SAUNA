class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :saunner_id
      t.integer :sauna_id
      t.date :visit_date
      t.integer :sauna_minutes
      t.integer :mizu_minutes
      t.integer :totonoi_minutes
      t.integer :sauna_times
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
