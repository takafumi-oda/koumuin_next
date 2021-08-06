class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :age_id, null: false
      t.integer :organization_id, null: false
      t.integer :job_id, null: false
      t.text :introduction
      t.boolean :admin, null: false, default: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
