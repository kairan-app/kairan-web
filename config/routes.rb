Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  post "/google_auth_callback", to: "sessions#create"
  delete "/session", to: "sessions#destroy", as: "session"

  root "welcome#index"
end
