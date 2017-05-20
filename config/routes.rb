Rails.application.routes.draw do
  namespace :api do
    %i(borrowers payments).each do |resource|
      resources resource, only: %i(create update destroy)
    end
  end

  get '/', to: 'pages#index'
end
