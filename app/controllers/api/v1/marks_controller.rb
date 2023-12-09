class Api::V1::MarksController < Api::V1::BaseController
  def create
    url = UrlCleaner.new(params[:url]).clean
    item = Item.find_or_create_by(url: url)
    mark = Mark.create(user: @current_user, item: item)

    head :created
  end
end
