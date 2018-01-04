Rails.application.routes.draw do
  resources :posts
  root 'home#index'
  #  root 'messages#index'
    resources :messages, only: [:create, :destroy, :index, :new]
  devise_for :users, controllers: {registrations: "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
