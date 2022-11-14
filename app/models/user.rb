class User < ApplicationRecord
	has_many :likes
    has_many :comment_on_products, dependent: :destroy
	has_one :order, dependent: :destroy
	has_one :cart, dependent: :destroy
    	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable 
     devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
    after_create :send_mail
    def send_mail
        #email_id = self.email_id
        UserMailer.with(user: self).welcome_email.deliver_now    
    end
    def generate_jwt
        # byebug
        JWT.encode({id: id, exp: 2.hours.from_now.to_i}, ENV["devise_jwt_secret"])
    end

end
