class ServicesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @category_services = @category.services
    @q = @category_services.ransack(params[:q])
    @services = @q.result.page(params[:page]).per(6)
  end

  def new
    @service = Service.new
    @service.packages.build
  end

  def create   
    @service = current_user.services.build(service_params)
    if @service.save
      redirect_to profile_path(current_user)
      flash[:notice] = "Service Created Successfully"
    else
      render :new 
      flash[:notice] = @service.errors.full_messages
    end
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

  private
  def service_params
    params.require(:service).permit(:title, :description, :category_id, :favorites_count, packages_attributes: [:id, :_destroy, :name, :price, :description, :is_commercial, :revision_number, :delivery_time])
  end

end
