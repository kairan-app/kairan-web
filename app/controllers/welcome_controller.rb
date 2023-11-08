class WelcomeController < ApplicationController
  def index
    @marks = Mark.order(created_at: :desc).limit(20)
  end
end
