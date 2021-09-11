class AddStatusIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :status_id, :integer, null: false
  end
end
