Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resource :reservations

  # # CRUD

  # # Read
  # get 'reservations', to: 'reservations#index'
  # get "reservations/:id", to: "reservations#show", as: 'reservation'

  # # Create
  # get 'transportations/:id/reservations/new', to: 'reservations#new'
  # get 'reservations/new', to: 'reservations#new'
  # post 'reservations', to: 'reservations#create', as: 'new'

  # # Update
  # get 'reservations/:id/edit', to: 'reservations#edit', as: 'edit'
  # patch 'reservations/:id', to: 'reservations#update'

  # # Destroy
  # delete 'reservations/:id', to: 'reservations#destroy', as: 'delete'
# end

  resources :transportations do
    resources :reservations, only: [:index, :new, :create]
  end
  resources :reservations, only: [:show, :edit, :update, :destroy]
  # Delete the transportation
  delete 'transportations/:id', to: 'transportations#destroy', as: 'delete_transportation'
end
