class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, photos: [])
  end
end
