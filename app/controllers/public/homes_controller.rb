class Public::HomesController < ApplicationController
  def top
  end

  def about
  end

  def new_guest
    end_user = EndUser.find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
    end
    sign_in end_user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end
end
