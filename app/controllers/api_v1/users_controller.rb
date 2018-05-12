class ApiV1::UsersController < ApiController
  skip_before_action :authenticate_user_from_token!, only: [:login, :registered, :forgot_password, :new_authentication_token]
  
  
  def login
    user = User.find_by_email(params['email'].downcase)
    if user.valid_password?(params['password']) then
      user.authentication_token = Devise.friendly_token()
      user.authentication_token_time = Time.now() 
      user.refresh_token = Devise.friendly_token()
      user.refresh_token_time = Time.now()
      user.save()
      response.headers['Authorization'] = "Basic #{user.authentication_token}"
      message = 'Login success.'
    else
      message = 'email or password is uncorrect.'
    end
    render json: { message: message, user_id: user.id, refresh_token: user.refresh_token }, status: 200
  end

  def registered
    user = User.new(params.require(:user).permit(:email, :password, :passowrd_confirm, :gender, :phone, :nickname, :first_name, :last_name))

    if user.save
      render json: user.as_json( auth_token: user.authentication_token, email: user.email ), status: 201
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end

  def forgot_password
    user = User.find_by_email(params['email'].downcase)
    User.reset_password(user)
    render json: { message: "請至信箱收信" }, status: 200
  end

  def new_authentication_token
    user = User.where(params.require(:info).permit(:refresh_token, :id)).first
    refresh_time = ((Time.now - user.refresh_token_time) / 1.days).round
    
    if refresh_time > 15
      render json: { message: "請重新登入!"}, status: 401
      return
    end

    user.update(authentication_token: Devise.friendly_token(), authentication_token_time: Time.now)
    response.headers['Authorization'] = "Basic #{user.authentication_token}"
    render json: { message: "refresh success."}, status: 200
  end

  # ====================================================================================

  def index
    
  end
  
  def new
    
  end
  
  def create
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def show
    
  end
  
  def destroy
    
  end
end