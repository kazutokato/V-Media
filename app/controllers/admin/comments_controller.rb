# frozen_string_literal: true

module Admin
  class CommentsController < ApplicationController
    def destroy
      @review = Review.find(params[:review_id])
      @comment = Comment.find(params[:id])
      @comment.destroy
    end
  end
end
