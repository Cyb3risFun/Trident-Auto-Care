Rails.application.routes.draw do
  devise_for :employees, path: '/i_am_loyal_to_trident', :controllers => { :registrations => "employees/registrations" }
  devise_for :users, path: 'users'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments
  root 'appointments#index'
  get "/all_apt", to: "appointments#printall"
  get '/users' => "appointments#printall", :as => :user_root
  get '/i_am_loyal_to_trident' => "records#index", :as => :employee_root
  get '/i_am_loyal_to_trident/print_all' => "records#print_all", :as => :employee_print_all
  get '/i_am_loyal_to_trident/show/:id' => "records#show", :as => :employee_show_apt
  get '/i_am_loyal_to_trident/approved/:id'=> "records#approved", :as => :approved
  get '/i_am_loyal_to_trident/time_conflict/:id'=> "records#time_conflict", :as => :time_conflict
  get '/i_am_loyal_to_trident/cancel/:id' => "records#destroy", :as => :employee_cancel_apt
end
