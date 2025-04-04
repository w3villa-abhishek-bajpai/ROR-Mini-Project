class AddNewaddressToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :local_address, :string
    add_column :students, :permanent_address, :string

  end
end
