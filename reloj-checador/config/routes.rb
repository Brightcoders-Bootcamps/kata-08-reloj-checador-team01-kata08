Rails.application.routes.draw do
  devise_for :admins, :controllers => { sessions: "admins/sessions",
                                        registrations: "admins/registrations",
                                        passwords: "admins/passwords",
                                        confirmations: "admins/confirmations" }
  resources :companies
  
  root 'attendaces#new'
  resources :attendaces, except: [:edit, :delete]
  resources :companies
  resources :employees

  get 'reports/att_by_day'
  get 'reports/avg_time_by_employees'
  get 'reports/absence_by_month'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
