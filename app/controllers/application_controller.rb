class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(_resource)
    movies_path
  end

  # def respond_with(resource, _opts = {})
  #   redirect_to after_sign_up_path_for(resource), status: :found
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
