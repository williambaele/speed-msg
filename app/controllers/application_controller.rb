class ApplicationController < ActionController::Base

  add_flash_types :info, :error, :success
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[pseudo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[pseudo])
  end

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    sign_in(resource)
    flash[:success] = "Account created and signed in"
    root_path
  end

  def after_sign_in_path_for(resource)
    flash[:success] = "Logged in"
    root_path
  end
end
