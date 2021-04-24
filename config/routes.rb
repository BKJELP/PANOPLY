Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, only: [:new, :create] do
    resources :outfits, only: [:list, :new, :create, :update, :show]
  end
  resources :outfits, only: [ :destroy ]
  resources :outfits, only: [ :index, :show] do
    resources :reservations, only: [:new, :create, :index, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
