Rails.application.routes.draw do
  
  root 'static_pages#who_are_you', via: [:get, :post]
  post '/static_pages/who_are_you', to: 'static_pages#who_are_you'

  get '/accueil', to:'static_pages#accueil'

  get '/team', to: 'static_pages#team'

  get '/contact', to: 'static_pages#contact'

  get "/gossips/:id", to: "dynamic_pages#gossips"

  get "/gossips/:id/user", to: "dynamic_pages#user"

  #get '/week/:week_position/day/:day_position', to: 'days#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
