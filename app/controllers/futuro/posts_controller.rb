# frozen_string_literal: true
class Futuro::PostsController < ApplicationController
  include Postable
  before_action :authenticate_user!
  before_action :find_user_post, only: [:edit, :update, :destroy]

  def new
    #   @todo: Post::CreateDraft.new(author: current_user).perform
    @post = Post.new(title: 'Your title', author: current_user, blog: current_user.blogs.first)
    @post.save!(validate: false)
    redirect_to edit_futuro_post_path(@post)
  end

  def edit; end

  def update
    prepare_post
    if @post.update_attributes(post_params)
      redirect_to show_post_path(@post.to_uri), notice: :created
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :blog_id, :tag_list)
  end

  def checked_blog
    current_user.blogs.find(params[:post][:blog])
  end

  def prepare_post
    @post.author = current_user
  end
end
