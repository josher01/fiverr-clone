class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.build(service_id: params[:service_id])
    !!@favorite.save ? flash[:notice] = "You have add it into your favorites" : flash[:alert] = "Already put into favorited collection.."
    redirect_back fallback_location: root_path
  end

  def destroy
    @favorite = current_user.favorites.where(service_id: params[:id]).first
    @favorite.destroy if @favorite.present?
    redirect_back fallback_location: root_path
  end
end
