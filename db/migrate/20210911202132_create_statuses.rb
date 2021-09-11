class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :category, null: false

      t.timestamps
      t.index :category, unique: true
    end
  end
end
