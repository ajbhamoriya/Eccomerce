class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items, dependent: :destroy
	has_one :address, dependent: :destroy
  #belongs_to :order
	def check_coupon(coupon)
		@coupon = coupon
		if self.total > @coupon.min_cart_value
			if @coupon.discount_type == "flat"
				discount = @coupon.discount
				coupon_id = @coupon.id
				self.update(discount: discount, coupon_id: coupon_id)
				return discount
			elsif @coupon.discount_type == "percentage"
				discount = (self.total*@coupon.discount)/100
				coupon_id = @coupon.id
				self.update(discount: discount, coupon_id: coupon_id)
				return discount
			end
		end
	end
	
end
