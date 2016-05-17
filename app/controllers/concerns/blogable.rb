# frozen_string_literal: true
module Blogable
  extend ActiveSupport::Concern

  private

  def find_blog
    @blog = Blog.find_by_uri! params[:blog]
  end
end
