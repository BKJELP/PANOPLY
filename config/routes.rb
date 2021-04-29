Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users, only: [:new, :create] do
    resources :outfits, only: [:list, :new, :create, :update, :show]
  end
  resources :outfits, only: [ :destroy ]
  resources :outfits, only: [ :index, :show] do
    resources :reservations, only: [:new, :create, :index, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
