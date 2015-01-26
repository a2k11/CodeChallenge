class ApplicationController < ActionController::Base
  attr_accessor :status
  protect_from_forgery
  helper_method :current_user, :signed_in, :is_admin

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def is_admin
    if current_user.admin
      true
    else
      false
    end
  end

  def signed_in
    current_user != nil
  end
end
