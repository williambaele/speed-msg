class ApplicationController < ActionController::Base
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[pseudo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[pseudo])
  end

  def after_sign_in_path_for(_resource)
    root_path
  end
end
