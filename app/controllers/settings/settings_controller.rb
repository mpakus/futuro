# frozen_string_literal: true

class Settings::SettingsController < ApplicationController
  before_action :authenticate_user!
  layout 'simple'

  def index
    @blog = current_user.blogs.new
  end

  def create
    return render :index unless create_blog

    redirect_to settings_path
  end

  private

  def create_blog
    return unless params[:blog]
    @blog = current_user.blogs.create(blog_params)
  end

  def blog_params
    params.require(:blog).permit(:name, :uri, :description)
  end
end
