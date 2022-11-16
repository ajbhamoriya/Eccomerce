class Api::V1::OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :coupon_id,:order_items

  # attribute :order_items do |object| 
  #   @object.order_items
  # end
end

