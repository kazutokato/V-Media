class Admin::MediaController < ApplicationController
  def create
    @medium_new = Medium.new(medium_params)
    @medium_new.save
    redirect_to admin_review_categories_path
  end

  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy
    redirect_to admin_review_categories_path
  end

  private

  def medium_params
    params.require(:medium).permit(:content)
  end

end
