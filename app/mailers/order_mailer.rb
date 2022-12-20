class OrderMailer < ApplicationMailer
	def new_order_email
  	    @order = params[:order]
        @user = params[:user]
        @order_items = params[:order_items]
        mail(to: "anjali@yopmail.com", subject: "You got a new order!")
    end
   
    def send_digest
        @user = params[:user]
        @order = params[:order]
        mail(to: @user.email, subject: "your status is updated")
    end
end


# class OrderMailer < ApplicationMailer
    
#       def order_confirmed order
#           # byebug
#         @order = order
#             # byebug
#             attachments["order_invoice_#{@order.id}.pdf"] = WickedPdf.new.pdf_from_string(render_to_string(template: '/orders/invoice.html.erb', layout: false))
#              mail(to: 'supriyas@witmates.com', subject: 'Ordered Successfully')
#       end
# end
#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