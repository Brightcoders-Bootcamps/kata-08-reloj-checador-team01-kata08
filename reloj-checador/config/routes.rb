Rails.application.routes.draw do
  devise_for :admins, :controllers => { sessions: "admins/sessions",
                                        registrations: "admins/registrations",
                                        passwords: "admins/passwords",
                                        confirmations: "admins/confirmations" }
  resources :companies

  root to: redirect("/companies")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
