class AddAlternatecontactToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :alernate_contact_number, :string
  end
end
