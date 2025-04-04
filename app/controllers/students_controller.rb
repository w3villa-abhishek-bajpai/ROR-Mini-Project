class StudentsController < ApplicationController
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
          redirect_to @student, notice: "Student was successfully created."
        else
          render :new, status: :unprocessable_entity # Ensure errors show up
        end
      end
    
    def show
        @student = Student.find(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            redirect_to student_path(@student), notice: "Student was successfully updated."
        else
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy
        @student = Student.find(params[:id])
        @student.destroy
        redirect_to students_path, notice: "Student was successfully deleted."
    end

    private

    def student_params
        params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :permanent_contact_number, :local_address, :permanent_address, :alernate_contact_number)
    end
end   