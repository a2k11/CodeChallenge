class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:session][:username])

    if user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      current_user
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    current_user
    redirect_to root_path
  end
end
