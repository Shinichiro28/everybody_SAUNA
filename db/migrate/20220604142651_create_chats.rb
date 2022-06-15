class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|

      t.integer :saunner_id, null: false
      t.integer :chat_group_id, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
