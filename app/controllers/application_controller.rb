class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :country, :city])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username, :description, :art_type])
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  helper_method :page_background_class

  def page_background_class
    return 'homepage-navbar' if params[:action] == 'home' && params[:controller] == 'pages'
    return 'background_blue' if params[:action] == 'index' && params[:controller] == 'users/work_of_arts'
    return 'background_blue' if params[:action] == 'my_favorites' && params[:controller] == 'work_of_arts'
    return 'background_pink' if params[:action] == 'index' && params[:controller] == 'users'
    return 'background_pink' if params[:action] == 'show' && params[:controller] == 'users'
    return 'background_blue' if params[:action] == 'index' && params[:controller] == 'work_of_arts'
    return 'background_blue' if params[:action] == 'show' && params[:controller] == 'work_of_arts'
    return 'background_green' if params[:action] == 'index' && params[:controller] == 'exhibitions'
    return 'background_green' if params[:action] == 'show' && params[:controller] == 'exhibitions'
    return 'background_yellow' if params[:action] == 'index' && params[:controller] == 'collabs'
    return 'background_yellow' if params[:action] == 'show' && params[:controller] == 'collabs'
    return 'background_yellow' if params[:action] == 'index' && params[:controller] == 'user_collab_relationships'
  end

  # app/controllers/application_controller.rb

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
