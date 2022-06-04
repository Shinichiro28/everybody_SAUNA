class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|

      t.integer :saunner_id
      t.integer :chat_group_id
      t.string :message

      t.timestamps
    end
  end
end
