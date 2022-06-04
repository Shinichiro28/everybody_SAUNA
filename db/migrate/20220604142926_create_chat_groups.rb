class CreateChatGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_groups do |t|

      t.string :name
      t.text :introduction
      t.integer :owner_id

      t.timestamps
    end
  end
end
