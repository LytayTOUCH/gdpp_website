class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def layout_by_resource
    if devise_controller?
      "administrator"
    else
      "application"
    end
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    new_admin_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    administrator_index_path
  end

  # def after_update_path_for(resource_or_scope)
  #   # administrator_index_path
  #   puts "____________________________"
  # end

end
