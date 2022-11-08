class AddressesController < ApplicationController
	def new
		@address = Address.new
	end
	def edit
		@address = Address.find(params[:id])
	end
end