class UsersController < ApplicationController
  def show
    @user = User.find_by(name: params[:user_name])
    @marks = @user.marks.includes(:item).order(created_at: :desc).page(params[:page])
  end
end
