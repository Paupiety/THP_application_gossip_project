Rails.application.routes.draw do
  
  root 'welcome#index', via: [:get, :post]

  resources :team, only: [:index]
  resources :contact, only: [:index]

  resources :accueil, only: [:index]


  resources :gossips do
    resources :users, only: [:show] do
      resources :city, only: [:show]
    end
  end

  resources :users, only: [:show] do
    resources :city, only: [:show]
  end

  resources :comments




  get "up" => "rails/health#show", as: :rails_health_check
end
