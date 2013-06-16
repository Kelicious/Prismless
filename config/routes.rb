DiscussGen::Application.routes.draw do
  root to: 'static#home'
  devise_for :users

  resources :users, only: [:show]

  resources :communities do
    resources :categories, only: [:new, :create]
    resources :memberships, only: [:new, :create]

    post 'favorites', to: 'favorites#create'
    delete 'favorites', to: 'favorites#destroy'
  end
  resources :categories, except: [:new, :index] do
    resources :forums, only: [:new]
  end

  resources :forums, except: [:index] do
    resources :topics
  end
  
  resources :topics, only: [:show]

  resources :posts, only: [:create, :edit, :update] do
    post 'votes', to: 'votes#create'
    delete 'votes', to: 'votes#destroy'
  end
end
