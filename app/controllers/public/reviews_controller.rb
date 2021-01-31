class Public::ReviewsController < ApplicationController
  before_action :correct_end_user, only: [:edit, :update] #投稿したユーザーのみ、編集が可能。

  def new
    @review_new = Review.new
  end

  def create
    @review_new = Review.new(review_params)
    @review_new.end_user_id = current_end_user.id
    if @review_new.save
      redirect_to review_path(@review_new.id)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to reviews_path
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:content_name, :cast, :gender, :body, :rate)
  end

  def correct_end_user
    @review = Review.find(params[:id])
    @end_user = @review.end_user
    if current_end_user != @end_user
      redirect_to reviews_path
    end
  end
end
