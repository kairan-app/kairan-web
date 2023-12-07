class Api::V1::MeController < Api::V1::BaseController
  def show
    render json: @current_user
  end
end
