DiscussGen::Application.routes.draw do
  root to: 'static#home'
  devise_for :users

  resources :users, only: [:show]

  resources :communities do
    resources :categories, only: [:new, :create]
    resources :memberships, only: [:new, :create]
  end
  resources :categories, except: [:new, :index] do
    resources :forums, only: [:new]
  end

  resources :forums, only: [:index, :show, :create, :edit, :update] do
    resources :topics
  end
  
  resources :topics, only: [:show]

  resources :posts, only: [:create]
end
