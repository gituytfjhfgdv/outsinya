Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: %i[destroy]
  namespace :users do
    root to: 'homes#index'
    resources :personal_words, only: %i[index destroy create]
    resources :daily_user_word_records, only: :index
  end
end
