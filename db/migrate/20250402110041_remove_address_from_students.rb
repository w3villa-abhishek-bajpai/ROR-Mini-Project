class RemoveAddressFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :address, :string
  end
end
