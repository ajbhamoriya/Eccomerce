#class ApplicationController < ActionController::Base
	#before_action :configure_permitted_parameters, if: :devise_controller?
  #protected
	#def configure_permitted_parameters
    	#devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :contact_number, :date_of_birth, :address])
  	#end
#end
#Api::V1::
module Api
	module V1

		class ApiController < ActionController::API
			before_action :authenticate_user!
    		respond_to :json, :html
			before_action :process_token
   			private
     		# Check for auth headers - if present, decode or send unauthorized response (called always to allow current_user)
			def process_token
				if request.headers['token'].present?
					begin
						jwt_payload = JWT.decode(request.headers['token'], ENV["devise_jwt_secret"]).first
                		@current_user_id = jwt_payload['id']
					rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
						#byebug
						render json: {message: 'Session expired.'}, status: :unauthorized
						# head :unauthorized
					end
				end
			end
	
    		# If user has not signed in, return unauthorized response (called only when auth is needed)
			def authenticate_user!(options = {})
				# byebug
				# head :unauthorized unless signed_in?
				render json: {message: 'Session expired.'}, status: :unauthorized unless signed_in?

			end

			def current_user
				# byebug
				#@current_user ||= super || User.find(@current_user_id)
				@current_user = User.find_by_id(@current_user_id)
			end

    		# check that authenticate_user has successfully returned @current_user_id (user is authenticated)
			def signed_in?
				# byebug
				@current_user_id.present?
    		end
		end
	end
end






