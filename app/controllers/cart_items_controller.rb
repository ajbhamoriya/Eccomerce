class CartItemsController < ApplicationController
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
	end

	def destroy
		cart = current_user.cart
		@cart_item =CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path

	end
end
