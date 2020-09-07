class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post).order(created_at: :desc)
  end
end
