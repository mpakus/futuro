# frozen_string_literal: true
class Futuro::ApplicationController < ActionController::Base
  include Postable
  protect_from_forgery with: :exception
  layout 'application'

  before_action :authenticate_user!
end
