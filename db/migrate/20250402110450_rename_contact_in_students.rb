class RenameContactInStudents < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :contact, :permanent_contact_number
  end
end
