class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items, dependent: :destroy
	
	enum status: {	
    confirmed: 1,
    out_for_delivery: 2,
    delivered: 3,
    canceled: 4
    }

	after_create :place_order

	after_update :send_status_mail, if: :saved_change_to_status?
    

    def send_status_mail
    	user_id = self.user_id
		@user = User.find(user_id)
		OrderMailer.with(order: self,user: @user).send_digest.deliver_now
    end

	def place_order
		user_id = self.user_id
		@user = User.find(user_id)
		@order_items = self.order_items
		OrderMailer.with(order: self,user: @user,order_items: @order_items).new_order_email.deliver_now
	end

end
