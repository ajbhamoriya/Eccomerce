class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name
end