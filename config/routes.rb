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

  resources :projects, only: [:index, :show, :show, :edit, :update] do 
    resources :tickets do
      collection do
        post :upload_file
      end
    end
  end

  scope path: "tickets/:ticket_id", as: :ticket do
    resources :comments, only: [:create]
  end
end
