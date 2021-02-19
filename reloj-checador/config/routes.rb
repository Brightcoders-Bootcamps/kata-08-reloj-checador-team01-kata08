Rails.application.routes.draw do
  root "welcome#index"

  devise_for :admins, :controllers => { sessions: "admins/sessions",
                                        registrations: "admins/registrations",
                                        passwords: "admins/passwords",
                                        confirmations: "admins/confirmations" }

  resources :companies
  resources :companies
  resources :employees

  resources :attendaces, except: [:edit, :delete]

  get "/welcome", to: "welcome#index"
  get "/checkin", to: "checkins#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
