Flickbar2::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => 'home#index'

  resources :friendships

  devise_for :users, :controllers => { :omniauth_callbacks => "authorizations" } do
    get 'sign_in', :to => 'sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :watches do
    member do
      post :watched
      post :wish
      post :copy
    end
  end

  resources :movies do
    resources :comments
    member do
      post :watch
      post :wish
      post :unwatch
    end
  end

  match '/news', :to => 'events#index', :as => 'news'
  match '/autocomplete', :to => 'movies#autocomplete'

  #  the last route
  match '/:nickname/:status', :to => 'users#show', :constraints => {:nickname => /.+/}, :as => 'user_status'
  match '/:nickname', :to => 'users#show', :as => 'user', :constraints => {:nickname => /.+/}

end
