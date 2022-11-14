module Api
	module V1
		class WishlistsController < ApiController
			 before_action :authenticate_user!
			def index

				if current_user.likes.present?
		    		@likes = current_user.likes
					render json: @likes
				else
					render json: {message: "not items exist"}
				end
    		end 	
		end
	end
end
