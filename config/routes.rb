Rails.application.routes.draw do

  devise_for :users
  root "news_feeds#index"
  # ----------------------------
  # Web Mode
  resources :followers, only: [:destroy] do
    collection do
      get :follow_whom
      get :follow_me
    end
  end

  resources :follower_apply_forms, only: [:update, :destroy] do
    collection do
      get :i_want_to_follow_whom
      get :who_wants_to_follow_me
    end
  end

  resources :news_feeds, except: [:new, :edit] do
    member do
        post :upload_image
    end
  end
  # ----------------------------
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
          post :follow_whom
          post :follow_me
      end

    end

  end
end
