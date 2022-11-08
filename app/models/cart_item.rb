class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product
  after_save :total_amount
  after_destroy :total_amount_reduce
  after_save :remove_from_stock 
  after_destroy :return_to_stock


  def remove_from_stock
    product.stock_quantity -= self.quantity
    product.save
  end

  def return_to_stock
    product.stock_quantity += self.quantity
    product.save
  end

  def total_amount
    total = 0
    cart.cart_items.each do|cart_item|
      total = cart_item.price + total
    end
    cart.update(total: total)
    if cart.coupon_id.present?
      coupon_id = cart.coupon_id
      coupon = Coupon.find(coupon_id)
      cart.check_coupon(coupon)
    end
  end

  def total_amount_reduce
    total = cart.total
    total = total - self.price
    cart.update(total: total)
    if cart.coupon_id.present?
      coupon_id = cart.coupon_id
      coupon = Coupon.find(coupon_id)
      if cart.total <= coupon.min_cart_value
        coupon_id = nil
        discount = 0
        cart.update(coupon_id: coupon_id, discount: discount)
      else
      cart.check_coupon(coupon)
      end
    end
  end
end
