# frozen_string_literal: true

class Futuro::Posts::PublishesController < Futuro::ApplicationController
  before_action :find_user_post, only: [:create]

  # Publish Post
  def create
    Post::Publish.new(@post).perform
  end
end
