Rails.application.routes.draw do

  get 'chatroom_note_comments/create'
  get 'chatroom_photos/create'
  get 'chatroom_photos/destroy'
  root "news_feeds#index"
  # ----------------------------
  # Web Mode
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users, only: [:index, :show]
  resources :friend_apply_forms, only: [:index, :create, :destroy]
  resources :friends, only: [:index, :create, :destroy]
  resources :chatrooms, except: [:destroy] do
    resources :chatroom_groups, only: [:index, :create, :destroy], shallow: true, as: :groups
    resources :chatroom_notes, except: [:new], shallow: true, as: :notes
    resources :chatroom_photos, only: [:create, :destroy], shallow: true, as: :photos
  end
  resources :chatroom_note_comments, only: [:create], shallow: true

  resources :followers, only: [:destroy] do
    collection do
      get :follow_whom
      get :follow_me
    end
  end

  
  resources :follower_apply_forms, only: [:create, :update, :destroy] do
    collection do
      get :i_want_to_follow_whom
    end
  end
  get "/apply_for_following", to: "follower_apply_forms#who_wants_to_follow_me"

  resources :news_feeds, except: [:new] do
    resources :news_feed_comments, as: :comments
    member do
        post :upload_image
    end
  end

  resources :news_feed_likes, only: [:update, :destroy]
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


  mount ActionCable.server => '/cable'
end
