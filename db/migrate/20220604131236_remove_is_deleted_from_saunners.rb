class RemoveIsDeletedFromSaunners < ActiveRecord::Migration[6.1]
  def change
    remove_column :saunners, :is_deleted, :boolean
  end
end
