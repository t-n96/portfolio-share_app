Rails.application.routes.draw do
  root to: 'home#top'
  resources :posts do
    collection do
      post :confirm
      get :index_all
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
