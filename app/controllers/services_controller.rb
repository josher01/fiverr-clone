class ServicesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @category_services = @category.services
    @q = @category_services.ransack(params[:q])
    @services = @q.result || @category.services
  end

  def create

  end

  def new
  end

  def edit
  end

  def update
  end

  def show
    @service = Service.find(params[:id])
    @packages = @service.packages
    @seller = @service.seller
  end


end
