# frozen_string_literal: true
module Postable
  extend ActiveSupport::Concern

  private

  def find_user_post
    @post = current_user.posts.find_by_token!(params[:id] || params[:post_id])
  end

  def find_fresh_posts
    @posts = Post.includes(:blog, :author).order(created_at: :desc).page(params[:page]).per(15)
  end

  def find_posts_by_blog(blog = nil)
    blog ||= @blog
    @posts = blog.posts.includes(:blog, :author).page(params[:page]).per(15)
  end
end
