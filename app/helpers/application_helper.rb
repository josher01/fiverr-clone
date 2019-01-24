module ApplicationHelper
  #category icon helper
  def category_fa_icon(category_name)   
    if category_name == Category::CAT_LIST[0]
      "fa fa-laptop"
    elsif category_name == Category::CAT_LIST[1]
      "fa fa-pencil"
    elsif category_name == Category::CAT_LIST[2]
      "fa fa-music"
    elsif category_name == Category::CAT_LIST[3]
      "fa fa-codepen"
    elsif category_name == Category::CAT_LIST[4]
      "fa fa-briefcase"
    elsif category_name == Category::CAT_LIST[5]
      "fa fa-industry"
    end 
  end
  #pop up log-in form integrating with devise
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  #helper for displaying correct status of favorite icon
  def favorite_heart(user, service)
    unless user_signed_in?
      return "<i class='fa fa-heart'></i>".html_safe
    end
    if service.is_favorited?(user)
      link_to "<i class='fa fa-heart'></i>".html_safe, favorite_path(id: service.id), method: :delete
    else
      link_to "<i class='fa fa-heart-o'></i>".html_safe, favorites_path(service_id: service.id), method: :post
    end
  end

  def default_image_url
    i = (1..20).to_a.sample
    "https://randomuser.me//api//portraits//women//#{i}.jpg"
  end
end


