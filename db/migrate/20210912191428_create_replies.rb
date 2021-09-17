class CreateReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :replies do |t|
      t.text :content, null: false
      t.integer :user_id
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
