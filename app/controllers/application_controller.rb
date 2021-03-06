class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :nickname])
  end
end
