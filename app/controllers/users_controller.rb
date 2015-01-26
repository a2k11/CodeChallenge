class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(params[:user])
    
    if user.save
      session[:user_id] = user.id
      if user.admin
        redirect_to admin_path
      else
        redirect_to index_path
      end
    else
      render :new
    end
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(params[:user])
      redirect_to index_path
    else
      redirect_to :back
    end
  end
end
