class Posts::PostsController < ApplicationController
  include Blogable
  include Postable

  before_action :find_fresh_posts, only: [:index]
  before_action :find_blog, only: [:show]
  before_action :find_post, only: [:edit, :update, :destroy]
  layout 'posts', only: [:index]

  def index; end

  def show
    @post = @blog.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def user
    @user  = User.find_by_uri(params[:user_uri])
    @posts = @user.posts.page(params[:page]).per(10)
    render 'main/index'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :access, :blog_id)
  end
end
