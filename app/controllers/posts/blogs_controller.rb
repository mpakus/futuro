# frozen_string_literal: true
class Posts::BlogsController < ApplicationController
  include Blogable
  include Postable

  layout 'posts'

  before_action :find_blog, :find_posts_by_blog, only: [:index]

  def index; end
end
