Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  if Rails.env.development?
    require "sidekiq/web"
    mount Sidekiq::Web, at: "/sidekiq"
  end

  post "/google_auth_callback", to: "sessions#create"
  delete "/session", to: "sessions#destroy", as: "session"

  post "/marks", to: "marks#create", as: "marks"

  get "/@:user_name", to: "users#show", as: "user", constraints: { user_name: /[a-z0-9\.]+/ }

  root "welcome#index"
end
