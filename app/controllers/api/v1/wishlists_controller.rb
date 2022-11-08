module Api
	module V1
		class WishlistsController < ApiController
			def index
    			@likes = current_user.likes
    			render json: @likes
    		end 	
		end
	end
end
