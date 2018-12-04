module ApplicationHelper
  CAT_LIST = ["Graphic & Design", "Digital Marketing", "Music & Audio", "Programming & Tech", "Fun & Lifestyle", "Writing & Translation"]
  def category_fa_icon(category_name)
    
    if category_name == CAT_LIST[0]
      "fa fa-laptop"
    elsif category_name == CAT_LIST[1]
      "fa fa-pencil"
    elsif category_name == CAT_LIST[2]
      "fa fa-music"
    elsif category_name == CAT_LIST[3]
      "fa fa-codepen"
    elsif category_name == CAT_LIST[4]
      "fa fa-briefcase"
    elsif category_name == CAT_LIST[5]
      "fa fa-industry"
    end 
  end

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
end


