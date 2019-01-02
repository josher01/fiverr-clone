class PagesController < ApplicationController
  def index
    @services = Service.order(created_at: :desc).take(6)
  end


end
