Rails.application.routes.draw do
  get 'app/index'
  namespace :api do
    resources :todos, only: %i[index show create update destroy]
  end
  root 'app#index'
end
