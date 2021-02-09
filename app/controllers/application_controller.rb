class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :country, :city])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username, :description])
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  helper_method :page_background_class

  def page_background_class
    return 'background_yellow' if params[:action] == 'home' && params[:controller] == 'pages'
    return 'background_pink' if params[:action] == 'index' && params[:controller] == 'users'
    return 'background_pink' if params[:action] == 'show' && params[:controller] == 'users'
    return 'background_blue' if params[:action] == 'index' && params[:controller] == 'work_of_arts'
    return 'background_blue' if params[:action] == 'show' && params[:controller] == 'work_of_arts'
  end
end
