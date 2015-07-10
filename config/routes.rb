Rails.application.routes.draw do
  root :to => 'home#index'

  resources :skills do
    resources :projects, :except => [:index]
  end
end
