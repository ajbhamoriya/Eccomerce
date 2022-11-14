module Api
    module V1		
		class CartItemsController < ApiController
			#before_action :authenticate_user!
			def index
				#byebug
				@cart = current_user.cart
				#byebug
				cart_id = @cart.id
				@cart_items = CartItem.where(cart_id: cart_id)
				if current_user.cart.present?
					cart = current_user.cart
					@address = cart.address
				end
				render json: @cart_items
			end

			def destroy
				cart = current_user.cart
				@cart_item =CartItem.find(params[:id])
				@cart_item.destroy
			    render json: {meta:{message: "successfully remove from cart"}}

			end
		end
	end
end
