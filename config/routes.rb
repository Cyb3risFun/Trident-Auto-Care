Rails.application.routes.draw do
  devise_for :employees, path: 'employees', :controllers => { :registrations => "employees/registrations" }
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments
  root 'appointments#index'
  get "/all_apt", to: "appointments#printall"
  get '/users' => "appointments#printall", :as => :user_root
  get '/employees' => "records#index", :as => :employee_root
end
