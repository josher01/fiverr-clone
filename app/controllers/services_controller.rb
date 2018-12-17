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
    @service = Service.new
    @service.packages.build
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


  def service_params
    params.require(:service).permit(:title, :description, :category_id, :favorites_count, packages_attributes: [:id, :_destroy, :name, :price, :description, :is_commercial, :revision_number, :delivery_time])
  end

end
