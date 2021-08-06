class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :job, null: false

      t.timestamps
      t.index :job, unique: true
    end
  end
end
