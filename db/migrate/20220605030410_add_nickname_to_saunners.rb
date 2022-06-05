class AddNicknameToSaunners < ActiveRecord::Migration[6.1]
  def change
    add_column :saunners, :nickname, :string, null: false
  end
end
