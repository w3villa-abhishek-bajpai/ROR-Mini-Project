class Admin::StudentsController < ApplicationController
    include ApplicationHelper
    before_action :authenticate_admin_user!
    
    before_action :set_student, only: %i[show edit update destroy]
    helper_method :formatted_date
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
          CrudNotificationMailer.create_notification(@student).deliver_now
          redirect_to admin_students_path, notice: "Student was successfully created."
        else
          render :new, status: :unprocessable_entity # Ensure errors show up
        end
      end
    
    def show
        @student = Student.find(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
        date = formatted_date(@student.date_of_birth)
    end

    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            CrudNotificationMailer.update_notification(@student).deliver_now

            redirect_to admin_student_path(@student), notice: "Student was successfully updated."
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy
        @student = Student.find(params[:id])
        @student.courses.clear
        CrudNotificationMailer.delete_notification(@student, Student).deliver_now
        @student.destroy
        redirect_to admin_students_path, notice: "Student was successfully deleted."
    end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :permanent_contact_number, :local_address, :permanent_address, :alernate_contact_number)  
    end

    def formatted_date(date)
        date.strftime('%A, %b %d, %Y') if date.present?
   end

   def set_student
    @student = Student.find(params[:id])
  end
    
end