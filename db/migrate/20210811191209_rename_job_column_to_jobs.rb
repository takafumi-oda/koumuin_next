class RenameJobColumnToJobs < ActiveRecord::Migration[6.1]
  def change
    rename_column :jobs, :job, :category
  end
end
