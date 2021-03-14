Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :projects, except: [:edit] do
    resources :comments, only: :create
  end

  root to: "landing_pages#show"
end
