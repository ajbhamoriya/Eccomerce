class WishlistsController < ApplicationController
	def index
    	likes = current_user.likes
    	@likes = likes.where(likeable_type: "Product")

    end 	
end
#User.where('age > 20').pluck(:id)
#User.where(id: [1,2,3]).pluck(:name)