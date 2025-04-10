class Course < ApplicationRecord
    has_and_belongs_to_many :students 
    validates :name, :description, presence: true
    validates :name, uniqueness: true
    validates :description, length: { minimum: 2, maximum: 40 }
end
