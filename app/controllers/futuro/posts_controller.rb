# frozen_string_literal: true

class Futuro::PostsController < Futuro::ApplicationController
  before_action :find_user_post, only: %i[edit update destroy]

  def create
    #   @todo: Post::CreateDraft.new(author: current_user).perform
    @post = Post.new(title: 'Post title', author: current_user, blog: current_user.blogs.first)
    @post.save!(validate: false)
    redirect_to edit_futuro_post_path(@post)
  end

  def edit; end

  def update
    prepare_post
    @post.update(post_params)
  end

  # def destroy; end

  private

  def post_params
    params.require(:post).permit(:title, :blog_id, :tag_list, :header)
  end

  def prepare_post
    @post.author = current_user
  end
end
