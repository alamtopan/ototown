class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
  end

  def after_sign_in_path_for(resource)
    if current_user
      user_home_path
    elsif current_backend_admin
      backend_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :username
    end
    
end
