Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  resources :outfits, only: [:index, :list, :new, :create, :update, :show, :destroy, :edit]

  resources :outfits, only: [:show] do
    resources :reservations, only: [:create, :index, :update]
  end

  resources :reservations, only: [] do
    member do
      patch '/status', to: 'reservations#status'
    end
  end

  get "/dashboard", to: "pages#dashboard"
end
