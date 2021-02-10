Rails.application.routes.draw do
  root 'attendaces#new'
  resources :attendaces, except: [:edit, :delete]
  resources :companies
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
