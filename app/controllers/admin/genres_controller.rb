# frozen_string_literal: true

module Admin
  class GenresController < ApplicationController
    def create
      @genre_new = Genre.new(genre_params)
      @genre_new.save
      redirect_to admin_review_categories_path
    end

    def destroy
      @genre = Genre.find(params[:id])
      @genre.destroy
      redirect_to admin_review_categories_path
    end

    private

    def genre_params
      params.require(:genre).permit(:content)
    end
  end
end
