class PagesController < ApplicationController
  def index
    @categories = Category.all
    @services = Service.order(created_at: :desc).take(6)
  end


end
