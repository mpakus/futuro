class MainController < ApplicationController
  def index
    @posts = Post.newests.limit(10)
  end
end
