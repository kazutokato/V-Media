# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_location

  # 遷移画面の情報を残す
  def store_location
    if request.fullpath != '/end_users/sign_in' && \
       request.fullpath != '/end_users/sign_up' && \
       request.fullpath != '/end_users/password' && \
       !request.xhr?
      session[:previous_url] = request.fullpath
    end
  end

  # ログイン後、store_locationで取得した画面に遷移する。
  def after_sign_in_path_for(_resource)
    session[:previous_url] || root_path
  end

  # ログアウト前に最後に閲覧していた画面に次回ログイン時に遷移する。
  def after_sign_out_path_for(_resource)
    session[:previous_url] || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[last_name first_name gender age prefecture nickname])
  end
end
