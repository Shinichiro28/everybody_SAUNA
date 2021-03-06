class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|

      t.integer :saunner_id, foreign_key: true, null: false
      t.string :name, null: false
      t.string :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
