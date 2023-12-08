class ApiController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    def authenticate
      authenticate_with_http_token  do |token, options|
        app_password = AppPassword.find_by(token: token)

        if app_password
          app_password.touch(:last_used_at)
          @current_user = app_password.user
        else
          render json: { error: "Unauthorized" }, status: :unauthorized
        end
      end
    end
  end
