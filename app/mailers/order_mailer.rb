class OrderMailer < ApplicationMailer
	def new_order_email
  	    @order = params[:order]
        @user = params[:user]
        @order_items = params[:order_items]
        mail(to: "admin@example.com", subject: "You got a new order!")
    end
   
    def send_digest
        @user = params[:user]
        @order = params[:order]
        mail(to: @user.email, subject: "your status is updated")
    end
end