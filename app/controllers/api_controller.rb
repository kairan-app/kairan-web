class ApiController < ActionController::API
    include ActionController::HttpAuthentication::Token::ControllerMethods

    before_action :authenticate

    def authenticate
      authenticate_with_http_token  do |token, options|

      end
    end
  end
