class ServicesController < ApplicationController
  def index
    @categories = Category.all
    @category = Category.find(params[:category_id])
    @category_services = @category.services
    @q = @category_services.ransack(params[:q])
    @services = @q.result || @category.services
  end
end
