Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registration: "user_registration"}
  resources :users
  resources :products do
    resources :comments
  end

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  get 'simple_pages/landing_page'
  get 'simple_pages/thank_you'
  post 'simple_pages/thank_you'
  root 'simple_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
