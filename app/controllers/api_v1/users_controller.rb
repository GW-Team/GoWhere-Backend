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