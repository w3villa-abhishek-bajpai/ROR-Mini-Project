class AddProfileImageToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :profile_image, :string
  end
end
