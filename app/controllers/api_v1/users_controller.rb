class ApiV1::UsersController < ApiController
  skip_before_action :authenticate_user_from_token!, only: [:login, :registered, :forgot_password]
  
  
  def login
    user = User.find_by_email(params['email'].downcase)
    if user.valid_password?(params['password']) then
      user.authentication_token = Devise.friendly_token()
      user.save()
      response.headers['Authorization'] = user.authentication_token
      message = 'Login success.'
    else
      message = 'email or password is uncorrect.'
    end
    render :json => { :message => message }, :status => 200
  end

  def registered
    user = User.new(params.require(:user).permit(:email, :password, :passowrd_confirm, :gender, :phone, :nickname, :first_name, :last_name))

    if user.save
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end

  def forgot_password
    
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