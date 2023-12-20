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

  namespace :settings do
    get "/app_passwords", to: "app_passwords#index", as: "app_passwords"
    get "/app_passwords/new", to: "app_passwords#new", as: "new_app_password"
    post "/app_passwords", to: "app_passwords#create"
    delete "/app_passwords/:id", to: "app_passwords#destroy", as: "app_password"
  end

  namespace :api do
    namespace :v1 do
      get "/me", to: "me#show"
      post "/marks", to: "marks#create"
    end
  end

  root "welcome#index"
end
