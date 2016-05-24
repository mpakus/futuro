# frozen_string_literal: true
class Posts::PostsController < ApplicationController
  include Blogable
  include Postable

  before_action :find_fresh_posts, only: [:index]
  before_action :find_blog, only: [:show]
  layout 'posts', only: [:index]

  def index; end

  def show
    @post = @blog.posts.find_by_token!(params[:id])
  end

  def user
    @user  = User.find_by_uri(params[:user_uri])
    @posts = @user.posts.page(params[:page]).per(10)
    render 'main/index'
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :access, :blog_id)
  end
end
