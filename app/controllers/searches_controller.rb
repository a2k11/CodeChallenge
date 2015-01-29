class SearchesController < ApplicationController
  def show
    @posts = Post.find(:all, :conditions =>
                       ["content LIKE ? And title LIKE ?",
                        "%#{params[:search]}%","%#{params[:search]}%"])
  end

  def tags
    @posts = Post.tagged_with(params[:tag]).page(params[:page]).per(4)
  end
end
