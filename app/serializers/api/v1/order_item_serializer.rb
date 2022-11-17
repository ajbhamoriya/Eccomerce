class Api::V1::OrderItemSerializer < ActiveModel::Serializer  
  attributes :id, :order_id, :name,:price
  #belongs_to :product
  attribute :image do |object|
    Rails.application.routes.url_helpers.rails_blob_path(object.object.product.image, disposition: "attachment", only_path: true)
  end
end


