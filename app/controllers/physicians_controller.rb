class PhysiciansController < ApplicationController

	def index
		@physicians = Physician.all
	end

	def new
		@physician = Physician.new
	end

	def create
		@physician = Physician.new(params.require(:physician).permit(:name, :photo))
		if @physician.save
			redirect_to @physician
		else
			render 'new'
		end
	end

	def show
		@physician = Physician.find(params[:id])
	end

	def edit
		@physician = Physician.find(params[:id])
	end

	def update
		@physician = Physician.find(params[:id])
		if @physician.update(params.require(:physician).permit(:name, :photo))
			redirect_to @physician
		else
			render "edit"
		end
	end
	def see
		@physician = Physician.find(params[:id])
		@appointments = @physician.appointments
	end
end


