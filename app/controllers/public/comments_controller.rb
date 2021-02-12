# frozen_string_literal: true

module Public
  class CommentsController < ApplicationController
    def create
      @review = Review.find(params[:review_id])
      @comment = current_end_user.comments.new(comment_params)
      @comment.review_id = @review.id

      respond_to do |format|
        if @comment.save
          format.js { flash.now[:comment_success] = '投稿が保存されました' }
        else
          format.js
        end
      end
    end

    def destroy
      @review = Review.find(params[:review_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash.now[:comment_delete] = '削除しました'
    end

    private

    def comment_params
      params.require(:comment).permit(:body)
    end
  end
end
