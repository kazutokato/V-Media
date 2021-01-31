class Public::CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    comment = current_end_user.comments.new(comment_params)
    comment.review_id = @review.id
    comment.save
  end

  def destroy
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
