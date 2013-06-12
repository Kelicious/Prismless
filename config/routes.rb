DiscussGen::Application.routes.draw do
  root to: 'forums#index'
  devise_for :users

  resources :communities do
    resources :categories, only: [:new, :create]
  end
  resources :categories, except: [:new, :index]

  resources :forums, only: [:index, :show] do
    resources :topics
  end
  
  resources :topics, only: [:index, :show] do
    resources :posts, only: [:create]
  end
end
