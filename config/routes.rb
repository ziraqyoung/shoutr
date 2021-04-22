Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: 'dashboard#show', as: :dashboard
  end
  # must come after above route
  root to: 'home#show'

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, only: [:create]

  resources :users, only: [:show, :create] do
    member do
      post "follow" => "followed_users#create"
      delete "unfollow" => "followed_users#destroy"
    end
    resource :password,
      controller: 'clearance/passwords',
      only: [:edit, :update]
  end

  get '/sign_in' => 'sessions#new', as: 'sign_in'
  delete '/sign_out' => 'sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'users#new', as: 'sign_up'

  resources :shouts, only: [:show, :create] do
    member do
      post "like" => "likes#create"
      delete "unlike" => "likes#destroy"
    end
  end
end
