Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  namespace :users do
    root to: 'homes#index'
    resources :positive_words, :negative_words
    resources :personal_words, only: :index
  end
end
