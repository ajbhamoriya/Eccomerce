class Api::V1::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  attribute :image do |object|
  #byebug 
    #Rails.application.routes.url_helpers.rails_blob_url(object.object.image) if object.object.image.attached?
    Rails.application.routes.url_helpers.rails_blob_url(object.object.image, disposition: "attachment", only_path: true)
  #byebug
  end
end


#rails_blob_path(@appointment.prescription, disposition: "attachment")
