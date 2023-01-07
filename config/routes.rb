Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'home#top'
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    member do
      get :favorites_all
    end
    collection do
      post :confirm
      get :draft
      get :index_all
      get :all_posts
      get 'search' => 'posts#search'
      get 'basic' => 'posts#basic'
      get 'stylish' => 'posts#stylish'
      get 'feminine' => 'posts#feminine'
      get 'sneaker' => 'posts#sneaker'
      get 'colorful' => 'posts#colorful'
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
end
