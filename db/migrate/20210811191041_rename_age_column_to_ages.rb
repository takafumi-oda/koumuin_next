class RenameAgeColumnToAges < ActiveRecord::Migration[6.1]
  def change
    rename_column :ages, :age, :category
  end
end
