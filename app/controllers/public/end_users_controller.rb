class Public::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user.id)
    else
      render :edit
    end
  end

  def withdraw
    @end_user = current_end_user
    @end_user.update(is_active: "Invalid") #updateで登録情報をInvalidに変更
    reset_session #sessionIDのresetを行う
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path #指定されたrootへのpath
  end

  def thanks
  end

  private

  def end_user_params
    params.require(:end_user).permit(:last_name, :first_name, :age, :prefecture, :nickname, :profile_image, :introduction)
  end
end
