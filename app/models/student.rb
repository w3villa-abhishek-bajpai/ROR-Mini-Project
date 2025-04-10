class Student < ApplicationRecord
    has_many :blogs
    #many to many association between project and student below 2 lines
    has_many :student_projects
    has_many :projects, through: :student_projects
    has_and_belongs_to_many :courses
    validates :first_name, :last_name, :email, presence: true 
    validates :email, uniqueness: true
    validates :first_name, :last_name, length: { minimum: 2, maximum: 40 }
    validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }    
    validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
    validates :permanent_contact_number, :alernate_contact_number, format: { with: /\A\d{10}\z/, message: "must be a 10-digit number" }
    after_create :display_students_age
    validate :validate_students_age



    def display_students_age
        if self.date_of_birth.present?
            age = Date.today.year - self.date_of_birth.year
            puts "Age of student is #{age}"
        else
            puts "Date of birth not provided"
        end
   end

   def validate_students_age
    if self.date_of_birth.present?
        age = Date.today.year - self.date_of_birth.year
        if age < 15
            errors.add(:age, "Student must be at least 15 years old")
        end
   end
end
    
    def full_name
        "#{first_name} #{last_name}"
    end

    def age
        if date_of_birth.present?
            Date.today.year - date_of_birth.year
        else
            nil
        end
    end


end
