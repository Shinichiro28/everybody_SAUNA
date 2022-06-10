class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|

      t.integer :saunner_id, null: false, foreign_key: true
      t.integer :post_id, null: false, foreign_key: true
      t.integer :sauna_id, foreign_key: true

      t.timestamps
    end
  end
end
