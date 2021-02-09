class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # after_action :store_location

  # def store_location
  #   if (request.fullpath != "/patients/sign_in" && \
  #       request.fullpath != "/patients/sign_up" && \
  #       request.fullpath != "/patients/password" && \
  #       !request.xhr?)
  #     session[:previous_url] = request.fullpath
  #   end
  # end

  # def after_sign_in_path_for(resource)
  #   session[:previous_url] || root_path
  # end

  # def after_sign_out_path_for(resource)
  #   session[:previous_url] || root_path
  # end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :gender, :age, :prefecture, :nickname])
  end

end

