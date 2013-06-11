DiscussGen::Application.routes.draw do
  root to: 'forums#index'
  devise_for :users

  resources :forums, only: [:index, :show] do
    resources :topics
  end
  
  resources :topics, only: [:index, :show] do
    resources :posts, only: [:create]
  end

  resources :posts, only: [:create]
end
