class AddIsDeletedToSaunner < ActiveRecord::Migration[6.1]
  def change
    add_column :saunners, :is_deleted, :boolean, default: false
  end
end
