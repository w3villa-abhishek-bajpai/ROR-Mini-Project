class Student < ApplicationRecord
    has_many :blogs
    #many to many association between project and student below 2 lines
    has_many :student_projects
    has_many :projects, through: :student_projects
    has_and_belongs_to_many :courses
    validates :first_name, :last_name, :email, presence: true   
    after_create :display_students_age

    def display_students_age
        if self.date_of_birth.present?
            age = Date.today.year - self.date_of_birth.year
            puts "Age of student is #{age}"
        else
            puts "Date of birth not provided"
        end
   end
end
