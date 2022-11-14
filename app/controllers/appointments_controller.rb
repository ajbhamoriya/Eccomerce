class AppointmentsController < ApplicationController
	def index
		@appointments = Appointment.all
	end

	def new
		@appointment=Appointment.new
		@patients =Patient.all
		@physicians = Physician.all
	end

	def create
		@appointment = Appointment.new(appointment_params)
		if @appointment.save
			redirect_to @appointment
		else
			@patients =Patient.all
		  @physicians = Physician.all
			render 'new'
		end
	end

	def show
		@appointment = Appointment.find(params[:id])
	end

	def edit
		@appointment = Appointment.find(params[:id])
		@patients = Patient.all
		@physicians = Physician.all
	end

	def update
		@appointment = Appointment.find(params[:id])
     if @appointment.update(appointment_params)
	   	redirect_to @appointment
	   else
	    render "edit"
	   end
	end
	def destroy
		@appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end
  def upload_files
  	
  	@appointment = Appointment.find(params[:id])
  	if @appointment.update(upload_params)
			render 'upload_files'
		else
			render 'show'
  	end
  end

 	def download_prescription
 		@appointment = Appointment.find(params[:id])
   	redirect_to rails_blob_path(@appointment.prescription, disposition: "attachment")
	end
	def download_test_report
		@appointment = Appointment.find(params[:id])
		redirect_to rails_blob_path(@appointment.test_report, disposition: "attachment")
	end

private
 	def appointment_params
 		params.require(:appointment).permit(:appointment_date, :physician_id, :patient_id, :test_report, :prescription)
 	end

  def upload_params
 		params.require(:appointment).permit(:prescription,:test_report)
 	end

end

# http://localhost:3000/appointments/new

