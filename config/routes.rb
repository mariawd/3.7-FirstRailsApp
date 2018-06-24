Rails.application.routes.draw do

  get 'payments/new'

  get 'payments/create'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', controllers: { registrations: "user_registrations" }}
  resources :users
  resources :products do
  resources :comments
  end

  get 'simple_pages/index'
  get 'simple_pages/contact'
  get 'simple_pages/about'
  get 'simple_pages/landing_page'

  root 'simple_pages#landing_page'

  post 'simple_pages/thank_you'
  post 'payments/create'

  mount ActionCable.server => '/cable'
  
  resources :orders, only: [:index, :show, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
