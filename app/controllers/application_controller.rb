class ApplicationController < ActionController::Base
  # before_action :authenticate_end_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :gender, :age, :prefecture, :nickname])
  end

end

