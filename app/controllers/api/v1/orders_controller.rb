module Api
	module V1
	  	class OrdersController < ApiController
	  	before_action :authenticate_user!  
	  		respond_to :js, :json, :html
 		  	Razorpay.setup('rzp_test_sGKFWWIENwCHjV', 'EX65NY1GAg5e6mTzJGJmoBE6')			
				def index
					if current_user.order.present? 
						@order = current_user.order
   						@order_items = @order.order_items
   						render json: @order
   					else 
   						render json: {meta: {message: "first_made_order"}}
   					end
				end

				def create
  				@cart = current_user.cart
  				@order = current_user.order.present? ? current_user.order : Order.create(user_id: @cart.user_id, discount: @cart.discount, coupon_id: @cart.coupon_id, total: @cart.total)
	  			if @cart.cart_items.present?
	  				@cart.cart_items.each do|cart_item|
	  				@order.order_items.create(product_id: cart_item.product_id, name: cart_item.name, price: cart_item.price, quantity: cart_item.quantity) 
	  			  #render json: { meta: "your order is created."}
	  			end
     				if @order.save
      				@cart.cart_items.destroy_all
        			order = Razorpay::Order.create(amount: (@order.total*100).to_i, currency: 'INR', receipt: 'TEST')
        			@order.update(razorpay_order_id: order.id)
        			#byebug
        			render json: { meta: "your order is created and razorpay_order_id is updated."}
      			else
        			render json: { meta: "your order is  not created as well as your razorpay_order_idis not updated."}
      			end
     				#@cart.cart_items.destroy_all
	    			#redirect_to cart_items_path
	    			#flash[:notice] = "order has made for #{current_user.email}"
    			end
  			end
  		end
  	end
  end
	