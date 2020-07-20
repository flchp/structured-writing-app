Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :account do
    resources :posts
  end

  post 'upload' => "photos#upload"

  namespace :foreground do
    resources :posts

    resources :users
  end
end
