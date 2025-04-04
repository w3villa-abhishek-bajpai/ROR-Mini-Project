class CoursesStudentsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :courses, :students
  end
end
