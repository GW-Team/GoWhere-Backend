Rails.application.routes.draw do

  # Web Mode
  devise_for :users

  # API Mode
  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :users do
      collection do
          post :login
          post :registered
          post :forgot_password
      end
    end
  end
end
