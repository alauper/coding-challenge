Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :tags
  end
  resources :comments

  root 'posts#index'
end
