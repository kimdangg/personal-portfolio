Rails.application.routes.draw do
  root :to => 'home#index'

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  delete "/log-out" => "sessions#destroy", as: :log_out

  resources :users

  resources :skills do
    resources :projects, :except => [:index]
  end
end
