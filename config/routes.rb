Rails.application.routes.draw do

  namespace :api_v1 do
    get 'followers/destroy'
    get 'followers/my_followers'
    get 'followers/who_follows_me'
  end
  namespace :api_v1 do
    get 'follower_apply_forms/index'
    get 'follower_apply_forms/create'
    get 'follower_apply_forms/update'
    get 'follower_apply_forms/destroy'
  end
  # Web Mode
  devise_for :users

  # API Mode
  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :users do
      collection do
        post :login
        post :registered
        post :forgot_password
        post :refresh_token, to: "users#new_authentication_token"
      end
    end

    resources :news_feeds, except: [:new, :edit] do
      member do
          post :upload_image
      end
    end

    resources :follower_apply_forms, except: [:new, :edit, :index, :show] do
      collection do
          post :I_want_to_follow_whom
          post :who_wants_to_follow_me
      end
    end

    resources :followers, only: [:destroy] do
      collection do
          post :my_followers
          post :who_follows_me
      end
      
    end

  end
end
