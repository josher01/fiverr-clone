class PagesController < ApplicationController
  def index
    @services = Service.all.take(6)
    @categories = Category.all.take(6)
  end
end
