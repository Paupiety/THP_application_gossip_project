Rails.application.routes.draw do
  root 'accueil#index', via: [:get, :post]
  get "/profil", to: "users#profil"

  resources :team, only: [:index]
  resources :contact, only: [:index]

  resources :accueil, only: [:index]


  resources :gossips do
    resources :users, only: [:show] do
      resources :city, only: [:show]
    end
  end

  resources :users, only: [:show, :create, :new] do
    resources :city, only: [:show]
  end

  resources :comments

  resources :sessions, only: [:destroy, :new, :create]

  resources :likes, only: [:create, :destroy]




  get "up" => "rails/health#show", as: :rails_health_check
end
