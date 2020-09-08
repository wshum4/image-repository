class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # Redirects the user to login page if they are not logged in
    # redirect_to new_user_session_path if current_user.nil?
    # show all posts by all users
    @posts = policy_scope(Post).order(created_at: :desc)
  end
end
