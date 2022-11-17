class OrdersController < ApplicationController
	respond_to :js, :json, :html
  Razorpay.setup('rzp_test_sGKFWWIENwCHjV', 'EX65NY1GAg5e6mTzJGJmoBE6')
	def index
		@order = current_user.order
    @order_items = @order.order_items
	end
	def create
  	@cart = current_user.cart
  	@order = current_user.order.present? ? current_user.order : Order.create(user_id: @cart.user_id, discount: @cart.discount, coupon_id: @cart.coupon_id, total: @cart.total)
	  if @cart.cart_items.present?
	  	@cart.cart_items.each do|cart_item|
	  		@order.order_items.create(product_id: cart_item.product_id, name: cart_item.name, price: cart_item.price, quantity: cart_item.quantity) 
	  	end
      if @order.save
      	@cart.cart_items.destroy_all
	    	flash[:notice] = "order has made for #{current_user.email}"
        order = Razorpay::Order.create(amount: (@order.total*100).to_i, currency: 'INR', receipt: 'TEST')
        @order.update(razorpay_order_id: order.id)
        #byebug
        redirect_to @order
      else
        redirect_to cart_items_path	
      end
     
	    #@cart.cart_items.destroy_all
	    #redirect_to cart_items_path
	    #flash[:notice] = "order has made for #{current_user.email}"
    end
  end
	
	def destroy
	  @order = Order.find(params[:id])
	  @order.destroy

	  redirect_to cart_items_path
	end

	def show
    @order = Order.find_by(id: params[:id])
    @cart = current_user.cart
  end
  
  def update
   #byebug
 		order = Order.find_by(id: params[:id])
		if order.present?
			payment_response = {razorpay_order_id: params[:razorpay_order_id], razorpay_payment_id: params[:razorpay_payment_id], razorpay_signature: params[:razorpay_signature] }
			#byebug
			verify_result = Razorpay::Utility.verify_payment_signature(payment_response)
			if verify_result
				#byebug
				order.update(razorpay_payment_id: params[:razorpay_payment_id] ,payment_status: "payment_completed")
			else
				#byebug
			flash[:error] = "something went wrong!!!" 
			redirect_to orders_path
			end
		end
  end
end 


# def cancel_order
# 	# byebug
# 	@order = Order.find_by_id(params[:id])
# 	# return redirect_to orders_path unless @order.present?
# 	if @order.status == "paymentcompleted" 
# 		refund = RefundPayment.new(@order).refund_payment
# 		@order.update(status: "refunded", razorpay_refund_id: refund.id)    #status canceled 
# 	elsif @order.status != "refunded" #or 
# 		@order.update(status: "cancelled")
# 		# byebug
# 	elsif @order.status == "created"
# 		@order.update(status: "cancelled")
# 	end
# 	redirect_to orders_path
# end

