# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << %i[name alias]
  end

  def after_sign_up_path_for(_resource)
    settings_path
  end
end
