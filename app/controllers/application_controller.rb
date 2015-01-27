class ApplicationController < ActionController::Base
  before_filter :popular_tags
  protect_from_forgery
  helper_method :current_user, :signed_in, :is_admin

  def current_user
    if (session[:user_id])
      User.find(session[:user_id])
    else
      Guest.new
    end
  end

  def is_admin
    if current_user.admin == true
      true
    else
      false
    end
  end

  def popular_tags
    @tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  def signed_in
    unless current_user.id
      false
    else
      true
    end
  end

  def authenticate_admin
    unless is_admin
      redirect_to root_path
    end
  end

  def authenticate_user
    unless signed_in
      redirect_to root_path
    end
  end
end
