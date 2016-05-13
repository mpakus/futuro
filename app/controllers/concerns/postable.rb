module Postable
  extend ActiveSupport::Concern

  private

  def find_fresh_posts
    @posts = Post.includes(:blog, :author).order(created_at: :desc).page(params[:page]).per(15)
  end

  def find_posts_by_blog(blog = nil)
    blog ||= @blog
    @posts = blog.posts.includes(:blog, :author).page(params[:page]).per(15)
  end
end
