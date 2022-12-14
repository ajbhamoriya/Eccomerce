class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def show
		@student = Student.find(params[:id])
	end

	def new
		@student=Student.new
	end

	def edit
		@student = Student.find(params[:id])
	end

    def create
    	@student = Student.new(params.require(:student).permit(:name))
    	if @student.save
    		redirect_to @student
    	else
    		render 'new'
    	end
    end

	def update
		@student =Student.find(params[:id])
		if @student.update(params.require(:student).permit(:name))
			redirect_to @student
		else
			render 'edit'
		end	
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy
		redirect_to students_path
	end
end


# http://localhost:3000/students/new
