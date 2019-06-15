Rails.application.routes.draw do
  root 'home#index'
  devise_for :users

  get '/onboarding', to: 'onboarding#new'
  post '/onboarding', to: 'onboarding#create'

  get '/home', to: 'home#index'

  namespace :api do
    resources :users, only: [:show]
    resources :events, only: [:index, :create, :show]
  end
end
