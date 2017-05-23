Rails.application.routes.draw do
  namespace :api do
    resources :borrowers, only: %i(show create update destroy)
    resources :payments, only: %i(create update destroy)
    resources :analytics, only: :index
  end

  get '/', to: 'pages#index'
end
