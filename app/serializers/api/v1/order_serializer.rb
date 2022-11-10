class Api::V1::OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :coupon_id,:order_items
end

