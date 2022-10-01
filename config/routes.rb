Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    root "application#index"
    resources :projects, except: [:index, :show]
    resources :users do
      member do
        patch :archive
      end
    end
  end

  devise_for :users

  root "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :projects, only: [:index, :show] do 
    resources :tickets
  end
end
