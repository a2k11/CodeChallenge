class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user.authenticate( params[:session][:password] )
      session[:user_id] = user.id
      if user.admin
        redirect_to admin_path
      else
        redirect_to dashboard_path
      end
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
