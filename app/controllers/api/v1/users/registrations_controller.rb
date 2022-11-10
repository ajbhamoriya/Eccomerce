class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_before_action :verify_authenticity_token, :only => :create
  before_action :sign_up_params, only: [:create]
  
  def create
    user = User.new(sign_up_params)
    # byebug
    if user.save
      token = user.generate_jwt
      user.update(token: token)
      # byebug
      render json: {user: user, meta: "successfully registered."}
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  #private

  def serialized_user resource
    Api::V1::UserSerializer.new(resource).as_json
  end
  
  protected
  
  def sign_up_params
    # byebug
    params.require(:user).permit(:email,:password,:first_name)
    #byebug
  end


end