Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects, except: [:edit, :index] do
    resources :comments, only: :create
  end

  root to: "projects#index"

  defaults format: :json do
    namespace :api do
      resources :projects, only: [] do
        resources :comments, only: :index
      end
    end
  end
end
