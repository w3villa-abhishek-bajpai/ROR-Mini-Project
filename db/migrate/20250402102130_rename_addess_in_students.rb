class RenameAddessInStudents < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :addess, :address
  end
end
