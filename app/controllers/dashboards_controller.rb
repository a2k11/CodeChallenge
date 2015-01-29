class DashboardsController < ApplicationController
  before_filter :authenticate_admin, only: [:admin]
  before_filter :authenticate_user, only: [:admin, :index]

  def admin
    @user = current_user
    @posts = Post.order(created_at: :desc).page params[:page]
  end

  def index
    @user = current_user
    @posts = current_user.posts
  end
end
