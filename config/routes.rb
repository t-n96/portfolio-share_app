Rails.application.routes.draw do
  root to: 'home#top'
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    member do
      get :favorites_all
    end
    collection do
      post :confirm
      get :draft
      get :index_all
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
end
