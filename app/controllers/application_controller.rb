class ApplicationController < ActionController::Base
  before_action :set_global_search_variable, :get_category_list

  private
  def set_global_search_variable
    @q = Service.ransack(params[:q])
  end

  def get_category_list
    @categories = Category.all
  end
end
