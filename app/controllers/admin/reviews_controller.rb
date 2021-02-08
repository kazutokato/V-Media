class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.page(params[:page]).per(6)
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to admin_reviews_path
    else
      render :show
    end
  end

end
