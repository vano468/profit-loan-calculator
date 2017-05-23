Rails.application.routes.draw do
  namespace :api do
    resources :borrowers, only: %i(show create update destroy)
    resources :payments, only: %i(create update destroy)
  end

  get '/', to: 'pages#index'
end
