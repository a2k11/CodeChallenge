class SearchesController < ApplicationController
  def show
    @posts = Post.find(:all, :conditions =>
                       ["content LIKE ? And title LIKE ?",
                        "%#{params[:search]}%","%#{params[:search]}%"])
  end

  def tags
    @posts = Post.tagged_with(params[:tag])
                 .paginate(:page => params[:page], :per_page => 10)
  end
end
