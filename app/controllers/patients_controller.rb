class PatientsController < ApplicationController
	def index
		@patients = Patient.all
	end

	def show
	 @patient = Patient.find(params[:id])
	 end	

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(params.require(:patient).permit(:name))
		if @patient.save
			redirect_to @patient
		else
			render 'new'
		end
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update(params.require(:patient).permit(:name))
			redirect_to @patient
		else
			render "edit"
		end
	end
	def see
		@patient = Patient.find(params[:id])
		@appointments = @patient.appointments
	end
end
