class MarksController < ApplicationController
  def create
    url = params[:url]
    item = Item.find_or_create_by(url: url)
    mark = Mark.create(user: current_user, item: item)

    redirect_to root_path
  end
end
