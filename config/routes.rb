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
      end
      collection do
        get :select_model_new
      end
    end
  end

  post 'upload' => "photos#upload"

  namespace :foreground do
    resources :posts

    resources :users
  end
end
