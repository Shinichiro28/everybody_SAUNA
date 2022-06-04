class CreateChatGroupUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_group_users do |t|

      t.integer :saunner_id
      t.integer :chat_group_id

      t.timestamps
    end
  end
end
