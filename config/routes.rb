Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments
  root 'appointments#index'
  get "/all_apt", to: "appointments#printall"
end
