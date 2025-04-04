# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
 
student = Student.create(
    first_name: "Abhishek",
    last_name: "Bajpai",
    email: "abc@gmail.com"
)


Student.all.each do |student|
    student.blogs.create(title: "My First Blog #{student.id}", content: "This is the content of my first blog.")
    student.blogs.create(title: "My Second Blog #{student.id}", content: "This is the content of my second blog.")
end


course = Course.create(
    name: "ROR",
    description: "RubyOnRails"

)

course = Course.create(
    name: "Java",
    description: "Springboot"

)