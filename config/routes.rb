Rails.application.routes.draw do
  get 'carts/show'
  get 'carts/destroy'
  get 'line_items/create'
  get 'line_items/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/profile", to: "pages#profile"
  get "/payment_page", to: "pages#payment_page"

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"

  resources :services, only: [:index]

  resources :bookings do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
