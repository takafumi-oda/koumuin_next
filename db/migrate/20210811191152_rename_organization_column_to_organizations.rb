class RenameOrganizationColumnToOrganizations < ActiveRecord::Migration[6.1]
  def change
    rename_column :organizations, :organization, :category
  end
end
