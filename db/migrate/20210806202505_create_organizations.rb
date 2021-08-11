class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :organization, null: false

      t.timestamps
      t.index :organization, unique: true
    end
  end
end
