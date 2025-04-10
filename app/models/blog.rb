class Blog < ApplicationRecord
    belongs_to :student
    validates :title, :content, presence: true
    validates :title, uniqueness: true
end
