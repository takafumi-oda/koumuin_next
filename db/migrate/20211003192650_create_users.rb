class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :age, null: false
      t.string :organization, null: false
      t.string :job, null: false
      t.string :status, null: false
      t.text :introduction
      t.boolean :active, null: false, default: true
      t.boolean :admin, null: false, default: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
