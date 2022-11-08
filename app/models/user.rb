class User < ApplicationRecord
	has_many :likes
    has_many :comment_on_products
	has_one :order, dependent: :destroy
	has_one :cart, dependent: :destroy
    	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
     devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist

    def generate_jwt
        JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
    end

end
