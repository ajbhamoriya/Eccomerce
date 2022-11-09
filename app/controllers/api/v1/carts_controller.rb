module Api
	module V1
		class CartsController < ApiController
	
			def add_to_cart
				@product = Product.find_by(id: params[:id])
				@cart = current_user.cart.present? ? current_user.cart : Cart.create!(user_id: current_user.id)
				#byebug
				if @cart.cart_items.exists?(name: @product.name)
					render json: { errors: "already exists in cart" }, status: :unprocessable_entity
                else
	  				@cart.cart_items.create!(product_id: @product.id, name: @product.name, price: @product.price, quantity: 1)
	  				render json: { meta: "successfully add to cart."}
	  			end
  			end

  			def apply_coupon
  				@coupon = Coupon.find_by(code: params[:code])
  				cart = current_user.cart
    			if @coupon.present? 
    				if cart.total > @coupon.min_cart_value
						discount = cart.check_coupon(@coupon)
    					render json: { meta: { discount:"#{discount}"} }
    				else
    					render json: { meta:{ message: "no discount avialable" }}
    				end	
	  			else
	  				render json: { meta:{ messsage: "invalid coupon code"} }
	  			end
 			end
            
            def create_cart_address	
 				cart = current_user.cart
 				address = Address.new(address_params)
 				address.cart_id = cart.id
 				if address.save
 					render json: { meta:{ message: "addresss successfully saved" }}
 				else
 					render json: { meta:{ message: "address not saved" }}
 				end
  			end

  			def update_cart_address
  				#byebug
  				cart = current_user.cart
  				address = Address.find(params[:id])
  				#byebug
  	 			address.cart_id = cart.id
    			if address.update(address_params)
  					render json: { meta:{ message: "addresss successfully updated" }}
 				else
                    render json: { meta:{ message: "address not updated!!" }}
 				end
 				#byebug
            end
            
            def destroy_cart_address
  				cart =current_user.cart
				address = Address.find(params[:id])
				cart.address.destroy
				render json: { meta:{ message: "address deleted!!" }}
 			 end

 			def destroy_coupon
  				cart = current_user.cart
  				coupon_id = cart.coupon_id
  				discount = 0
  				coupon_id = nil
    			cart.update(coupon_id: coupon_id, discount: discount)
    			render json: { meta:{ message: "coupon_removed!!" }}
  			end
  

           
         private
			def address_params
  	        	params.require(:address).permit(:name, :contact_number, :email_id, :address)
            end

        end
    end
end



      
      