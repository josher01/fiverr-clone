class ServicesController < ApplicationController
  def index
    @q = Service.ransack(params[:q])
    @services = @q.result
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end
end
