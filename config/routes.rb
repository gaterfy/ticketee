Rails.application.routes.draw do
  namespace :admin do
    get 'application/index'
  end
  devise_for :users
  root "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects do 
    resources :tickets
  end
end
