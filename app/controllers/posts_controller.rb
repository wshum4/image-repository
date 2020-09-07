class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post).order(created_at: :desc).where(user: current_user)
  end

  def show
    @post = Post.find(params[:id])
    authorize(@post)
  end

  def new
    @post = Post.new
    authorize(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize(@post)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize(@post)

    if @post.destroy
      redirect_to posts_path
    else
      flash[:alert] = "You are not owner of this post, you can't delete it!"
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :description, photos: [])
  end
end
