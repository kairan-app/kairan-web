class WelcomeController < ApplicationController
  def index
    @marks = Mark.order(created_at: :desc).page(params[:page])
  end
end
