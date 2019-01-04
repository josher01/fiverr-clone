class CategoriesController < ApplicationController
  def services
    @category = Category.find(params[:id])
    @services = @category.services.page(params[:page]).per(6)
  end
end
