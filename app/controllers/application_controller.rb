class ApplicationController < ActionController::Base
  before_action :authenticate_end_user!, except: [:top, :about]
  before_action :store_current_location, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || mypage_root_path
  end

  protected

  def store_current_location
    store_location_for(:user, request.url)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :gender, :age, :prefecture, :nickname])
  end

end

