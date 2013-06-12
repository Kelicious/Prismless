DiscussGen::Application.routes.draw do
  root to: 'forums#index'
  devise_for :users

  resources :communities do
    resources :categories, only: [:new, :create]
  end
  resources :categories, except: [:new, :index] do
    resources :forums, only: [:new, :create]
  end

  resources :forums, only: [:index, :show] do
    resources :topics
  end
  
  resources :topics, only: [:index, :show] do
    resources :posts, only: [:create]
  end
end
