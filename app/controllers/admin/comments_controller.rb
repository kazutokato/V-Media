class Admin::CommentsController < ApplicationController

  def destroy
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

end
