class Api::V1::MeController < Api::V1::BaseController
  def show
    render json: {
      name: @current_user.name,
      icon_url: @current_user.icon_url,
    }
  end
end
