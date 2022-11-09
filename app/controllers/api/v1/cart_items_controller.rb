module Api
	module V1
		class CartItemsController < ApiController
            def index
				#byebug
				@cart = current_user.cart
			    #byebug
				cart_id = @cart.id
				@cart_items = CartItem.where(cart_id: cart_id)
				#if current_user.cart.present?
					#cart = current_user.cart
					#@address = cart.address
				#end
                render json: @cart_items
			end
		end
	  
	end
end
