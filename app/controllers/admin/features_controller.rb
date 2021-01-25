class Admin::FeaturesController < ApplicationController
  def create
    @feature_new = Feature.new(feature_params)
    @feature_new.save
    redirect_to admin_review_categories_path
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy
    redirect_to admin_review_categories_path
  end

  private

  def feature_params
    params.require(:feature).permit(:content)
  end
end
