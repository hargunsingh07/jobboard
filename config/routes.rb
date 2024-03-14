Rails.application.routes.draw do
  get 'pages/about'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'job_listings#index'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :job_listings, only: [:index, :show] do
    resources :applicants, only: [:index]
  end

  resources :companies, only: [:show]
  resources :applicants, only: [:index, :show]

  get '/about', to: 'pages#about'
end
