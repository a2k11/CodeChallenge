class ApplicationController < ActionController::Base
  attr_reader :status
  protect_from_forgery
  helper_method :current_user

  private

  def current_user
    if session[:user_id]
      true
    else
      false
    end
  end
end
