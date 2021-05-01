Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :outfits, only: [:list, :index, :new, :create, :update, :show]
  resources :outfits, only: [ :destroy ]
  resources :reservations, only: [:new, :create, :index, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
