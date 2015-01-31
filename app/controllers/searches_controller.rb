class SearchesController < ApplicationController
  def show
    searchposts = Post.find(:all, :conditions =>
                       ["content LIKE ? Or title LIKE ?",
                        "%#{params[:search]}%","%#{params[:search]}%"])
    @posts = Kaminari.paginate_array(searchposts).page(params[:page]).per(5)
  end

  def tags
    @posts = Post.tagged_with(params[:tag]).page(params[:page]).per(4)
  end
end
