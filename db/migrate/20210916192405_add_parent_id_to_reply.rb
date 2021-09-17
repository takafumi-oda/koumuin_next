class AddParentIdToReply < ActiveRecord::Migration[6.1]
  def change
    add_column :replies, :parent_id, :integer
  end
end
