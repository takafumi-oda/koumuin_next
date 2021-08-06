class CreateAges < ActiveRecord::Migration[6.1]
  def change
    create_table :ages do |t|
      t.string :age, null: false

      t.timestamps
      t.index :age, unique: true
    end
  end
end
