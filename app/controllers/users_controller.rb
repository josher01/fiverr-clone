class UsersController < ApplicationController
  before_action :redirect_user_sign_in, only: [:new, :update]

  def new
    @user = current_user
  end


  def update
    @user = current_user
    if seller_params
      @user.update!(seller_params)
      flash[:notice] = "Seller Profile Created Successfully !"
    else
      flash[:notice] = "Something Went Wrong...Pls Try Again.."
    end
    redirect_back(fallback_location: root_path)
  end

  def show
    find_user
    @services = @seller.services
    @favorited_services = @seller.favorited_services
  end

  private
  def seller_params
    params.require(:user).permit(:name, :avatar, :description, :email, :country, :language)
  end

  def find_user
    @seller = User.find(params[:id])
  end

  def redirect_user_sign_in
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end