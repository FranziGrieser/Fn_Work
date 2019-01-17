Rails.application.routes.draw do
  resources :order_items, only: [:create, :update, :destroy]
  get 'carts/show'

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations"}

  resources :users
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  post 'simple_pages/thank_you'
  post 'payments/create'

  root 'simple_pages#index'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
