class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token, :only=> :create
  #private

  #def respond_with(resource, _opts = {})
    #render json: { message: 'You are logged in.' }, status: :ok
  #end

  #def respond_to_on_destroy
    #log_out_success && return if current_user

    #log_out_failure
  #end

  #def log_out_success
    #render json: { message: "You are logged out." }, status: :ok
  #end

  #def log_out_failure
    #render json: { message: "Hmm nothing happened."}, status: :unauthorized
  #end
  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      token = user.generate_jwt
      #render json: token.to_json
      user.update(token: token)
      render json: {user: user, meta: "successfully login."}
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
  
  def destroy
    # byebug
    JwtDenylist.find_or_create_by(jti: request.headers['token'], exp: Time.now) if request.headers['token']
    render json: { message: "signed out" }, status: 201
  end



  private
   def sign_in_params
    params.require(:user).permit(:email, :password)
   end
end


# def login
#       @user = User.find_by_email(params[:email])
#       # byebug
#       if @user&.authenticate(params[:password])
#           token = JsonWebToken.encode(user_id: @user.id)
#           #time = Time.now + 24.hours.to_i
#           render json: { token: token, user: @user }, status: :ok
#       else
#           render json: { error: 'unauthorized' }, status: :unauthorized
#       end
#     end

#   private

#    def login_params
#     params.permit(:email, :password)
#    end
# end