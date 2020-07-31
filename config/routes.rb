Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :account do
    resources :posts do
      member do
        post :set_private
        post :set_public
        post :set_model
        post :quit_set_model
        post :quit_like
      end
      collection do
        get :select_model_new
        get :like_posts_index
      end
    end
    resources :categories
  end

  post 'upload' => "photos#upload"

  namespace :foreground do
    resources :posts do
      member do
        post :like
        post :quit_like
      end
      resources :comments
    end

    resources :users
  end
end
