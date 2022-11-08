class CartsController < ApplicationController
	
	def add_to_cart
		@product = Product.find_by(id: params[:id])
		@cart = current_user.cart.present? ? current_user.cart : Cart.create!(user_id: current_user.id)
		if @cart.cart_items.exists?(name: @product.name)
			redirect_to home_path(@product.category)
			flash[:alert] = "this item is already added."
		else
	  	@cart.cart_items.create!(product_id: @product.id, name: @product.name, price: @product.price, quantity: 1)
	  	redirect_to cart_items_path
	  end
  end

  def apply_coupon
  	@coupon = Coupon.find_by(code: params[:code])
  	cart = current_user.cart
    if @coupon.present? 
    	if cart.total > @coupon.min_cart_value
				discount = cart.check_coupon(@coupon)
    		flash[:notice] = "discount = #{discount}"
    	else
    		redirect_to cart_items_path
    		flash[:alert] = "no discount available"
    	end	
	  else
	  	redirect_to cart_items_path
	  	flash[:alert] = "invalid coupon code"
	  end
 	end

 	def create_cart_address	
 		cart = current_user.cart
 		address = Address.new(address_params)
 		address.cart_id = cart.id
 		if address.save
 			flash[:notice]= "address successfully saved"
 		  redirect_to cart_items_path
 		else
 			flash[:alert]="address not saved"
 		end
  end	

  def update_cart_address
  	cart = current_user.cart
  	address = Address.find(params[:id])
  	 address.cart_id = cart.id
    if address.update(address_params)
  		flash[:notice]= "address successfully updated"
 		  redirect_to cart_items_path
 		else
 			flash[:alert]="address not update"
  	end
  end	

  def destroy_cart_address
  	cart =current_user.cart
		address = Address.find(params[:id])
		cart.address.destroy
		redirect_to cart_items_path
  end

  def destroy_coupon
  	cart = current_user.cart
  	coupon_id = cart.coupon_id
  	discount = 0
  	coupon_id = nil
    cart.update(coupon_id: coupon_id, discount: discount)
    redirect_to cart_items_path
  end
   
  def address_params
  	params.require(:address).permit(:name, :contact_number, :email_id, :address)
  end
end
