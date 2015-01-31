class PostsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorize_user, only: [:delete]

  def index
    @posts = Post.page(params[:page]).per(10).where(draft:false)
  end

  def preview
    @post = Post.new(params[:post])
    @preview = true
    render :show
  end

  def show
    @single_post = true
    @post = Post.find_by_slug(params[:slug])
  end

  def new
    @post = Post.new
  end

  def edit
    @no_header = true
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.new(params[:post])
    generate_tags

    if @post.save
      redirect_to dashboard_path
    else
      redirect_to :new
    end
  end

  def update
    @post = Post.find_by_slug(params[:slug])

    if @post.update_attributes(params[:post])
      generate_tags
      redirect_to dashboard_path, notice: "Post updated successfully"
    else
      redirect_to post_path(@post.id), action: :edit
    end
  end

  def destroy
    @post = Post.find_by_slug(params[:slug])
    @post.destroy

    redirect_to :back
  end

  private

  def generate_tags
    if params[:post][:tag_list]
      @post.tag_list.remove(params[:post][:tag_list])

      (params[:post][:tag_list]).to_s.split(/\s+/).each do |tag|
        @post.tag_list.add(tag.downcase).uniq
      end
    end
  end

  def authorize_user
    unless (@post.user_id == current_user.id || is_admin)
      redirect_to :back
    end
  end
end
