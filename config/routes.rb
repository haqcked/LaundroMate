Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "pages#profile"

  resources :services, only: [:index] do
    resources :bookings, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :bookings, only: [:show, :index] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: [:create]
  end

end
